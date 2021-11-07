#! /usr/bin/env python3
"""Generate a build script.

.. note::

    I get that this looks *massively* over engineered for a :file:`~/.vim`
    build script, but it fits in nicely with my ``subninja``-based home
    directory management… but yeah, that is probably overkill ;)
"""

from inspect import stack
from pathlib import Path
from shutil import which
from typing import List

import click
import ninja_syntax


def pretty(string: str, colour: bool = True) -> str:
    """Generate pretty output for :command:`ninja`’s non-verbose mode.

    Args:
        string: Text to prettify
        colour: Colourise output
    """
    head, tail = string.rsplit(maxsplit=1)
    space = ' ' * (9 - len(head))
    if colour:
        return ''.join(
            [click.style(head, 'green'), space, click.style(tail, bold=True)]
        )
    else:
        return ''.join([head, space, tail])


def wopt(name: str) -> str:
    """Generate a command line option string.

    Args:
        name: Option name
    """
    locals_ = stack()[2].frame.f_locals
    arg = name.replace('_', '-')
    val = locals_[name]
    if isinstance(val, bool):
        text = f'--{"" if val else "no-"}{arg}'
    else:
        if isinstance(val, str):
            val = [
                val,
            ]
        text = ' '.join(f'--{arg}={s}' for s in val)
    return text


@click.command()
@click.option('--local/--no-local', help='Generate standalone build file.')
@click.option(
    '--colour/--no-colour', default=True, help='Generate coloured output.'
)
@click.option(
    '--ctags',
    default='ctags-universal',
    metavar='COMMAND',
    help='Path to ctags.',
)
@click.option(
    '--rst2html',
    default='rst2html',
    metavar='COMMAND',
    help='Path to rst2html.',
)
@click.option(
    '--libc-langs',
    default='C,C++',
    metavar='LANGS',
    help='Languages to include in libc tags file.',
)
@click.option(
    '--libc-exclude',
    multiple=True,
    default=[
        'qt5',
    ],
    metavar='PATH',
    help='Directories to exclude from libc tags file.',
)
@click.option('--sphinx/--no-sphinx', help='Enable Sphinx build')
@click.argument(
    'file',
    type=click.Path(dir_okay=False, writable=True),
    callback=lambda c, p, v: Path(v),
    default=Path('build.ninja'),
)
def configure(
    local: bool,
    colour: bool,
    ctags: str,
    rst2html: str,
    libc_langs: str,
    libc_exclude: List[str],
    sphinx: bool,
    file: Path,
) -> None:
    """Write a ninja_ build configuration.

    .. _ninja: https://ninja-build.org/
    """
    if local:
        location = Path(__file__).parent
    else:
        location = Path.home() / '.vim'
    with file.open('w') as buildfile:
        n = ninja_syntax.Writer(buildfile)

        if local:
            n.comment('*Warning* Using local build rules')
            n.newline()

        n.rule(
            'configure',
            ' '.join(
                [f'{location / "build.py"} ', '$out']
                + [
                    wopt(s)
                    for s in [
                        'local',
                        'colour',
                        'ctags',
                        'rst2html',
                        'libc_langs',
                        'libc_exclude',
                        'sphinx',
                    ]
                ]
            ),
            description=pretty('CONFIG $out', colour),
            generator=True,
        )

        n.rule(
            'rst_compile',
            (
                f'{rst2html} --record-dependencies $out.d.tmp $in $out '
                '|| exit 1; '
                '[ -f $out.d.tmp ] && echo $out: $$(cat $out.d.tmp) > $out.d; '
                'rm -f $out.d.tmp'
            ),
            description=pretty('RST2HTML $out', colour),
            depfile='$out.d',
            deps='gcc',
        )

        n.rule(
            'sphinx_build',
            f'sphinx-build -M $builder {location} {location / ".build"}',
            description=pretty('SPHINX $out', colour),
        )

        # Note the .dep suffix to workaround vimrc.d being vimrc.rst’s default
        # dependency file.
        n.rule(
            'rst_extract',
            f'{location / "tools/rst2vim"} -r $out.dep $in $out',
            description=pretty('RST2VIM $out', colour),
            depfile='$out.dep',
            deps='gcc',
        )

        n.rule(
            'symlink',
            'ln -rsf $in $out',
            description=pretty('SYMLINK $out', colour),
        )

        ctags_path = which(ctags)
        n.rule(
            'tags_gen',
            f'{ctags_path} --languages=$lang -R $exclude -f $out $in',
            description=pretty('CTAGS $out', colour),
        )
        n.newline()

        n.build(
            f'{location / file}',
            'configure',
            inputs=[
                f'{location / "build.py"}',
            ],
            implicit=[
                ninja_syntax.__file__,
            ],
        )

        n.build(
            f'{location / "README.html"}',
            'rst_compile',
            inputs=[
                f'{location / "README.rst"}',
            ],
            implicit=[
                which(rst2html),
            ],
        )

        rst_files = [
            p
            for p in location.glob('**/*.rst')
            if '.includes' not in p.parts and '.github' not in p.parts
        ]

        if sphinx:
            n.build(
                f'{location / ".build/html"}',
                'sphinx_build',
                inputs=[
                    f'{location / "conf.py"}',
                ]
                + [p.as_posix() for p in rst_files],
                implicit=[
                    which('sphinx-build'),
                ],
                variables={
                    'builder': 'html',
                },
            )

        for p in rst_files:
            if p.parent.stem == 'support':
                continue
            elif p.name not in (
                'FAQ.rst',
                'README.rst',
                'background.rst',
                'index.rst',
                'todo.rst',
                'upgrades.rst',
            ):
                if p.name == 'vimrc.rst':  # No suffix on main vimrc file
                    output = f'{location / p.with_suffix("")}'
                else:
                    output = f'{location / p.with_suffix(".vim")}'
                n.build(
                    output,
                    'rst_extract',
                    inputs=[
                        f'{location / p }',
                    ],
                    implicit=[
                        f'{location / "conf.py"}',  # Required for rst_epilog
                        f'{location / "tools/rst2vim"}',
                    ],
                )

        tags = location / 'tags'
        n.build(
            f'{tags / "libc.ctags"}',
            'tags_gen',
            inputs=[
                '/usr/include',
            ],
            implicit=[
                ctags_path,
            ],
            variables={
                'exclude': ' '.join(
                    f'--exclude=$in/{d}' for d in libc_exclude
                ),
                'lang': libc_langs,
            },
        )

        lang_map = [
            ('lua', '/usr/share/lua', '*', 'lua%s'),
            ('python', '/usr/lib', 'python[0-9]*', '%s'),
            ('ruby', '/usr/lib/ruby', '[0-9]*', 'ruby%s'),
        ]
        for lang, path, glob, tags_name in lang_map:
            has_lang = False
            for p in sorted(Path(path).glob(glob)):
                n.build(
                    f'{tags / (tags_name % p.name)}.ctags',
                    'tags_gen',
                    inputs=[
                        p.as_posix(),
                    ],
                    implicit=[
                        ctags_path,
                    ],
                    variables={'lang': lang},
                )
                has_lang = True
            if has_lang:
                n.build(
                    f'{tags}/{lang}.ctags',
                    'symlink',
                    inputs=f'{tags / (tags_name % p.name)}.ctags',
                )


if __name__ == '__main__':
    configure()

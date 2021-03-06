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
)
def configure(
    local: bool,
    colour: bool,
    rst2html: str,
    libc_langs: str,
    libc_exclude: List[str],
    sphinx: bool,
    file: Path,
) -> None:
    """Write a ninja build configuration.

    Unless FILE is given this writes to ninja_’s default :file:`build.ninja`
    file.

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
                        'rst2html',
                        'libc_langs',
                        'libc_exclude',
                        'sphinx',
                    ]
                ]
            ),
            pretty('CONFIG $out', colour),
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
            pretty('RST2HTML $out', colour),
            '$out.d',
            deps='gcc',
        )

        n.rule(
            'sphinx_build',
            f'sphinx-build -M html {location} {location / ".build"}',
            pretty('SPHINX $out', colour),
        )

        # Note the .dep suffix to workaround vimrc.d being vimrc.rst’s default
        # dependency file.
        n.rule(
            'rst_extract',
            f'{location / "tools/rst2vim.py"} -r $out.dep $in $out',
            pretty('RST2VIM $out', colour),
            '$out.dep',
            deps='gcc',
        )

        n.rule('symlink', 'ln -rsf $in $out', pretty('SYMLINK $out', colour))

        ctags_path = which('ctags-exuberant')
        n.rule(
            'tags_gen',
            f'{ctags_path} --languages=$lang -R $exclude -f $out $in',
            pretty('CTAGS $out', colour),
        )
        n.newline()

        n.build(
            f'{location / file}',
            'configure',
            [
                f'{location / "build.py"}',
            ],
            [
                ninja_syntax.__file__,
            ],
        )

        n.build(
            f'{location / "README.html"}',
            'rst_compile',
            [
                f'{location / "README.rst"}',
            ],
            [
                which(rst2html),
            ],
        )

        rst_files = [
            p
            for p in location.glob('**/*.rst')
            if '.includes' not in p.parts and not '.github' in p.parts
        ]

        if sphinx:
            n.build(
                f'{location / ".build/html"}',
                'sphinx_build',
                [
                    f'{location / "conf.py"}',
                ]
                + [p.as_posix() for p in rst_files],
                implicit=[
                    which('sphinx-build'),
                ],
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
                'vimrc.rst',
            ):
                if p.name == 'vimrc.rst':  # No suffix on main vimrc file
                    output = f'{location / p.with_suffix("")}'
                else:
                    output = f'{location / p.with_suffix(".vim")}'
                n.build(
                    output,
                    'rst_extract',
                    [
                        f'{location / p }',
                    ],
                    [
                        f'{location / "tools/rst2vim.py"}',
                    ],
                )

        tags = location / 'tags'
        n.build(
            f'{tags / "libc.ctags"}',
            'tags_gen',
            [
                '/usr/include',
            ],
            [
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
                    [
                        p.as_posix(),
                    ],
                    [
                        ctags_path,
                    ],
                    variables={'lang': lang},
                )
                has_lang = True
            if has_lang:
                n.build(
                    f'{tags}/{lang}.ctags',
                    'symlink',
                    f'{tags / (tags_name % p.name)}.ctags',
                )


if __name__ == '__main__':
    configure()

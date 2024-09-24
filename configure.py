#! /usr/bin/env python3
"""Generate a build script.

.. note::

    I get that this looks *massively* over engineered for a :file:`~/.vim`
    build script, but it fits in nicely with my ``subninja``-based home
    directory management… but yeah, that is probably overkill ;)
"""

from inspect import stack
from itertools import chain
from os import environ
from pathlib import Path
from shutil import which
from shlex import quote
from subprocess import check_output
from typing import Optional

import ninja_syntax
import typer


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
            [
                typer.style(head, fg='green'),
                space,
                typer.style(tail, bold=True),
            ]
        )
    else:
        return ''.join([head, space, tail])


def wopt(name: str) -> str:
    """Generate a command line option string.

    Args:
        name: Option name
    """
    locals_ = stack()[2].frame.f_locals['use_params']
    arg = name.replace('_', '-')
    val = locals_[name]
    if isinstance(val, bool):
        text = f'--{"" if val else "no-"}{arg}'
    else:
        if isinstance(val, str):
            val = [
                val,
            ]
        text = ' '.join(f'--{arg}={quote(s)}' for s in val)
    return text


def configure(
    file: Path = typer.Argument(
        'build.ninja', help='Output file.', dir_okay=False, writable=True
    ),
    local: Optional[bool] = typer.Option(
        False, help='Generate standalone build file.'
    ),
    colour: Optional[bool] = typer.Option(
        True, help='Generate coloured output.'
    ),
    vim: Optional[str] = typer.Option(
        'vim', metavar='command', help='Path to vim.'
    ),
    ctags: Optional[str] = typer.Option(
        'ctags-universal', metavar='command', help='Path to ctags.'
    ),
    rst2html: Optional[str] = typer.Option(
        'rst2html', metavar='command', help='Path to rst2html.'
    ),
    libc_langs: Optional[str] = typer.Option(
        'C,C++#',
        metavar='langs',
        help='Languages to include in libc tags file.',
    ),
    libc_exclude: Optional[list[str]] = typer.Option(
        [
            'qt5',
        ],
        metavar='path',
        help='Directories to exclude from libc tags file.',
    ),
    sphinx: Optional[bool] = typer.Option(False, help='Enable Sphinx build'),
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

        n.comment('Untested with older versions')
        n.variable('ninja_required_version', 1.10)

        if local:
            n.comment('*Warning* Using local build rules')
            n.newline()

        n.rule(
            'configure',
            ' '.join(
                [f'{location / "configure.py"}', '$out']
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
                        'vim',
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
            'spellfile_compile',
            (
                f'{vim} -X --clean -N -V1 -e -s '
                '-c "try | silent mkspell! $in | finally | qall! | endtry" '
                '|| exit 1'
            ),
            description=pretty('SPELL $out', colour),
        )

        n.rule(
            'sphinx_build',
            f'sphinx-build -M $builder {location} {location / ".build"}',
            description=pretty('SPHINX $out', colour),
        )

        # Note the ``.dep`` suffix to workaround ``vimrc.d`` being
        # ``vimrc.rst``’s default dependency file.
        n.rule(
            'rst_extract',
            f'{location / "tools/rst2vim"} -d $out.dep $in $out',
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
            f'{ctags_path} --languages=$lang $extra_opts $exclude -f $out $in',
            description=pretty('CTAGS $out', colour),
        )
        n.newline()

        n.build(
            f'{location / file}',
            'configure',
            inputs=[
                f'{location / "configure.py"}',
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

        for p in chain(
            location.glob('spell/*.add'), location.glob('.meta/*.add')
        ):
            n.build(
                p.with_suffix(p.suffix + '.spl').as_posix(),
                'spellfile_compile',
                inputs=[
                    p.as_posix(),
                ],
                implicit=[
                    which(vim),
                ],
            )

        rst_files = [
            p
            for p in location.glob('**/*.rst')
            if p.relative_to(location).parts[0]
            not in ('.github', '.includes', 'maybe')
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
                if p.name == 'vimrc.rst':  # No suffix on main ``vimrc`` file
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
                        f'{location / "conf.py"}',  # Uses ``rst_epilog``
                        f'{location / "tools/rst2vim"}',
                    ],
                )

        repo_files = check_output(
            ['git', '-C', location, 'ls-files'], encoding='utf-8'
        ).splitlines()
        n.build(
            f'{location / "tags" /  "TAGS"}',
            'tags_gen',
            inputs=[f'{location}/{s}' for s in repo_files],
            implicit=[
                ctags_path,
            ],
            variables={
                'exclude': f'--exclude={location}/external/dein.vim',
                'lang': 'JSON,Python,ReStructuredText,Sh,Yaml',
            },
        )

        xdg_cache_dir = Path(environ.get('XDG_CACHE_HOME', '~/.cache'))
        dein_cache_dir = (
            xdg_cache_dir / 'vim' / 'dein' / 'repos' / 'github.com'
        )
        n.build(
            f'{location / "tags" /  "dein-repos.ctags"}',
            'tags_gen',
            inputs=dein_cache_dir.expanduser().as_posix(),
            implicit=[
                ctags_path,
            ],
            variables={
                'lang': 'JSON,Python,ReStructuredText,Sh,Yaml',
                'extra_opts': '--recurse',
            },
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
                'extra_opts': '--recurse',
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
                    variables={'lang': lang, 'extra_opts': '--recurse'},
                )
                has_lang = True
            if has_lang:
                n.build(
                    f'{tags}/{lang}.ctags',
                    'symlink',
                    inputs=f'{tags / (tags_name % p.name)}.ctags',
                )


if __name__ == '__main__':
    typer.run(configure)

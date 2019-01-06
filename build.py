#! /usr/bin/python3
"""Generate a build script.

.. note::

    I get that this looks *massively* over engineered for a :file:`~/.vim`
    build script, but it fits in nicely with my ``subninja``-based home
    directory management… but yeah, it is probably overkill ;)
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
    head, tail = string.rsplit()
    space = ' ' * (9 - len(head))
    if colour:
        return ''.join([click.style(head, 'green'), space,
                        click.style(tail, bold=True)])
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
        text = '--' + ('' if val else 'no-') + arg
    else:
        if isinstance(val, str):
            val = [val, ]
        text = ' '.join('--%s=%s' % (arg, s) for s in val)
    return text


@click.command()
@click.option('--local/--no-local', help='Generate standalone build file.')
@click.option('--colour/--no-colour', default=True,
              help='Generate coloured output.')
@click.option('--rst2html', default='rst2html.py', metavar='COMMAND',
              help='Path to rst2html.py.')
@click.option('--libc-langs', default='C,C++', metavar='LANGS',
              help='Languages to include in libc tags file.')
@click.option('--libc-exclude', multiple=True, default=['qt5', ],
              metavar='PATH',
              help='Dirctories to exclude from libc tags file.')
@click.option('--sphinx/--no-sphinx', help='Enable Sphinx build')
@click.argument('file', type=click.Path(dir_okay=False, writable=True),
                callback=lambda c, p, v: Path(v))
def configure(local: bool, colour: bool, rst2html: str, libc_langs: str,
              libc_exclude: List[str], sphinx: bool, file: Path):
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

        n.rule('configure',
               ' '.join([str(location / 'build.py'), '$out']
                        + [wopt(s) for s in ['local', 'colour', 'rst2html',
                                             'libc_langs', 'libc_exclude',
                                             'sphinx']]),
               pretty('CONFIG $out', colour),
               generator=True)

        n.rule('rst_compile',
               ('%s --record-dependencies $out.d.tmp $in $out; '
                '[ -f $out.d.tmp ] && echo $out: $$(cat $out.d.tmp) > $out.d; '
                'rm -f $out.d.tmp' % rst2html),
               pretty('RST2HTML $out', colour),
               '$out.d', deps='gcc')

        if sphinx:
            # The ugliness of this sed is because we need the change to be
            # idempotent as Sphinx only rebuilds modified files, and that may
            # not include dein.html.
            n.rule('sphinx_build',
                   ('sphinx-build -M html %s %s; '
                    r"sed '/ dein#add</s,\(&#39;\)\([^<~]\+\)\(&#39;\),"
                    r"\1<a href=\"https://github.com/\2/\">\2</a>\3,' "
                    '-i %s' % (location, location / '.build',
                               location / '.build/html/dein.html')),
                   pretty('SPHINX $out', colour))

        # Note the .dep suffix to workaround vimrc.d being vimrc.rst’s
        # dependency file.
        n.rule('rst_extract',
               '%s -r $out.dep $in $out' % (location / 'rst2vim.py'),
               pretty('RST2VIM $out', colour),
               '$out.dep', deps='gcc')

        n.rule('symlink', 'ln -rsf $in $out', pretty('SYMLINK $out', colour))

        n.rule('tags_gen',
               '/usr/bin/ctags-exuberant --languages=$lang -R $exclude -f $out $in',
               pretty('CTAGS $out', colour))
        n.newline()

        n.build(str(location / file), 'configure',
                [str(location / 'build.py'), ],
                [ninja_syntax.__file__, ])

        n.build(str(location / 'README.html'), 'rst_compile',
                [str(location / 'README.rst'), ],
                [which(rst2html), ])

        rst_files = [p for p in location.glob('**/*.rst')
                     if '.includes' not in p.parts]

        if sphinx:
            n.build(str(location / '.build/html'), 'sphinx_build',
                    [str(location / 'conf.py'), ]
                    + [p.as_posix() for p in rst_files],
                    implicit=[which('sphinx-build'), ])

        for p in rst_files:
            if p.name == 'vimrc.rst':
                n.build(str(location / p.with_suffix('')), 'rst_extract',
                        [str(location / p), ],
                        [str(location / 'rst2vim.py'), ])
            elif p.parent.stem == 'support':
                continue
            elif p.name not in ('FAQ.rst', 'README.rst', 'background.rst',
                                'index.rst', 'todo.rst'):
                n.build(str(location / p.with_suffix('.vim')), 'rst_extract',
                        [str(location / p), ],
                        [str(location / 'rst2vim.py'), ])

        tags = location / 'tags'
        ctags_path = which('ctags-exuberant')

        n.build(str(tags / 'libc.ctags'), 'tags_gen',
                ['/usr/include', ],
                [ctags_path, ],
                variables={
                    'exclude': ' '.join('--exclude=$in/' + d
                                        for d in libc_exclude),
                    'lang': libc_langs,
                })

        lang_map = [
            ('lua', '/usr/share/lua', '*', 'lua%s'),
            ('python', '/usr/lib', 'python[0-9]*', '%s'),
            ('ruby', '/usr/lib/ruby', '[0-9]*', 'ruby%s'),
        ]
        for lang, path, glob, tags_name in lang_map:
            has_lang = False
            for p in sorted(Path(path).glob(glob)):
                n.build('%s.ctags' % (tags / (tags_name % p.name)), 'tags_gen',
                        [p.as_posix(), ],
                        [ctags_path, ],
                        variables={'lang': lang})
                has_lang = True
            if has_lang:
                n.build('%s/%s.ctags' % (tags, lang), 'symlink',
                        '%s.ctags' % (tags / (tags_name % p.name)))


if __name__ == '__main__':
    configure()

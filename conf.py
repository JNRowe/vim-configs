#
"""conf - Sphinx configuration information."""

import os
import sys
from contextlib import suppress
from subprocess import CalledProcessError, PIPE, run
from typing import Dict, List, Optional, Tuple, Union

on_rtd = 'READTHEDOCS' in os.environ
if not on_rtd:
    import sphinx_rtd_theme  # type: ignore

# General configuration {{{
extensions: List[str] = [
    f'sphinx.ext.{ext}'
    for ext in [
        'autodoc',
        'doctest',
        'extlinks',
        'githubpages',
        'intersphinx',
        'todo',
    ]
]

if not on_rtd:
    # Showing document build durations is only valuable when writing, so we’ll
    # only enable it locally
    extensions.append('sphinx.ext.duration')
    # Only activate spelling if it is installed.  It is not required in the
    # general case and we don’t have the granularity to describe this in a
    # clean way
    try:
        from sphinxcontrib import spelling  # type: ignore
    except ImportError:
        pass
    else:
        spelling  # Dirty hack to silence F401 and type error
        extensions.append('sphinxcontrib.spelling')

    sys.path.insert(0, 'tools')
    extensions.append('vim_extractor')

rst_epilog = """
.. |ASCII| replace::
   :abbr:`ASCII (American Standard Code for Information Interchange)`
.. |CSV| replace:: :abbr:`CSV (Comma-separated values)`
.. |HTML| replace:: :abbr:`HTML (HyperText Markup Language)`
.. |Regex| replace:: :abbr:`RegEx (Regular Expression)`
.. |Python| replace:: `Python <https://www.python.org/>`__
.. |XDG basedir| replace:: `XDG base directory specification
   <http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html>`__
.. |git| replace:: `git <https://www.git-scm.com/>`__
.. |issue| replace:: `issue <https://github.com/JNRowe/vim-configs/issues/>`__
.. |ledger| replace:: `ledger <https://www.ledger-cli.org/>`__
.. |mail| replace:: `mail <jnrowe@gmail.com>`__
.. |neovim| replace:: `neovim <https://neovim.io/>`__
.. |reST| replace:: `reST <http://docutils.sourceforge.net/rst.html>`__
.. |remind| replace:: `remind
   <https://www.roaringpenguin.com/products/remind>`__
.. |vim| replace:: :command:`vim`
.. |zsh| replace:: `zsh <https://www.zsh.org/>`__
"""

needs_sphinx = '3.5'

nitpicky = True

exclude_patterns: List[str] = [
    '.build',
    '.github',
    'maybe',
    'README.rst',
    '**/README.rst',
]
# }}}

# Project information {{{
project = 'vim-configs'
copyright = '2009-2021  James Rowe'  # NOQA: A001

if on_rtd:
    with suppress(CalledProcessError):
        proc = run(
            [
                'git',
                '-C',
                os.path.dirname(__file__),
                'log',
                '--pretty=format:%ad [%h]',
                '--date=short',
                '-n1',
            ],
            stdout=PIPE,
        )
        html_last_updated_fmt = proc.stdout.decode()
else:
    # Use a static updated time to limit rebuilds for faster commit hooks
    html_last_updated_fmt = '[local build]'

release = html_last_updated_fmt
version = ''

trim_footnote_reference_space = True
# }}}

# Options for HTML output {{{
# readthedocs.org handles this setup for their builds, but it is nice to see
# approximately correct builds on the local system too
if not on_rtd:
    html_theme = 'sphinx_rtd_theme'
    html_theme_path: List[str] = [
        sphinx_rtd_theme.get_html_theme_path(),
    ]

highlight_language = 'vim'

html_copy_source = False
# }}}

# autodoc extension settings {{{
autoclass_content = 'init'
autodoc_default_options: Dict[str, Union[str, bool]] = {
    'members': True,
}
# }}}

# extlinks extension settings {{{
extlinks: Dict[str, Tuple[str, str]] = {
    'pypi': ('https://pypi.org/project/%s/', ''),
    'repo': ('https://github.com/%s/', ''),
    'wikipedia': ('https://en.m.wikipedia.org/wiki/%s', ''),
    'vimdoc': ('https://vimhelp.org/%s', ''),
}
# }}}

# intersphinx extension settings {{{
intersphinx_mapping: Dict[str, Tuple[str, Optional[str]]] = {
    k: (v, os.getenv(f'SPHINX_{k.upper()}_OBJECTS'))
    for k, v in {
        'click': 'https://click.palletsprojects.com/en/7.x/',
        'python': 'https://docs.python.org/3/',
    }.items()
}
# }}}

# napoleon extension settings {{{
napoleon_numpy_docstring = False
# }}}

# spelling extension settings {{{
spelling_ignore_acronyms = False
spelling_lang = 'en_GB'
spelling_word_list_filename = '.meta/en.utf-8.add'
spelling_ignore_python_builtins = False
spelling_ignore_importable_modules = False
# }}}

# todo extension settings {{{
todo_include_todos = True
# }}}

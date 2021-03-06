#
"""conf - Sphinx configuration information."""

import os
from contextlib import suppress
from subprocess import CalledProcessError, PIPE, run
from typing import Dict, List, Tuple, Union

on_rtd = 'READTHEDOCS' in os.environ
if not on_rtd:
    import sphinx_rtd_theme

# General configuration {{{
extensions: List[str] = (
    [
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
    + [f'sphinxcontrib.{ext}' for ext in []]
    + [
        'sphinx_autodoc_typehints',
        'sphinx_click.ext',
    ]
)

if not on_rtd:
    # Showing document build durations is only valuable when writing, so we’ll
    # only enable it locally
    extensions.append('sphinx.ext.duration')
    # Only activate spelling if it is installed.  It is not required in the
    # general case and we don’t have the granularity to describe this in a
    # clean way
    try:
        from sphinxcontrib import spelling  # NOQA: F401
    except ImportError:
        pass
    else:
        extensions.append('sphinxcontrib.spelling')

needs_sphinx = '3.1'

nitpicky = True

exclude_patterns: List[str] = ['.build', 'README.rst', '**/README.rst']
# }}}

# Project information {{{
project = 'vim-configs'
copyright = '2009-2021  James Rowe'  # NOQA: A001

with suppress(CalledProcessError):
    proc = run(
        ['git', 'log', '--pretty=format:%ad [%h]', '--date=short', '-n1'],
        stdout=PIPE,
    )
    html_last_updated_fmt = proc.stdout.decode()

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
intersphinx_mapping: Dict[str, str] = {
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

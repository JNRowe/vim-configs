#
"""conf - Sphinx configuration information."""

import os
from contextlib import suppress
from subprocess import CalledProcessError, PIPE, run

on_rtd = 'READTHEDOCS' in os.environ
if not on_rtd:
    import sphinx_rtd_theme

extensions = \
    ['sphinx.ext.%s' % ext for ext in ['autodoc', 'doctest', 'extlinks',
                                       'githubpages', 'intersphinx', 'todo']] \
    + ['sphinxcontrib.%s' % ext for ext in []] \
    + ['sphinx_autodoc_typehints', 'sphinx_click.ext']  # type: List[str]

if not on_rtd:
    # Only activate spelling if it is installed.  It is not required in the
    # general case and we don’t have the granularity to describe this in a
    # clean way
    try:
        from sphinxcontrib import spelling  # NOQA: F401
    except ImportError:
        pass
    else:
        extensions.append('sphinxcontrib.spelling')

with suppress(CalledProcessError):
    proc = run(
        ['git', 'log', '--pretty=format:%ad [%h]', '--date=short', '-n1'],
        stdout=PIPE)
    html_last_updated_fmt = proc.stdout.decode()

source_suffix = '.rst'

exclude_patterns = ['.build', 'README.rst', '**/README.rst']

project = 'vim-configs'
copyright = '2009-2019  James Rowe'  # NOQA: A001

release = html_last_updated_fmt
version = ''

# readthedocs.org handles this setup for their builds, but it is nice to see
# approximately correct builds on the local system too
if not on_rtd:
    html_theme = 'sphinx_rtd_theme'
    html_theme_path = [sphinx_rtd_theme.get_html_theme_path(), ]  \
        # type: List[str]

highlight_language = 'vim'

pygments_style = 'sphinx'

html_copy_source = False

# Autodoc extension settings
autoclass_content = 'init'
autodoc_default_options = {
    'members': True,
}  # type: Dict[str, Union[str, bool]]

# extlinks extension settings {{{
extlinks = {
    'pypi': ('https://pypi.org/project/%s/', ''),
    'repo': ('https://github.com/%s/', ''),
    'wikipedia': ('https://en.m.wikipedia.org/wiki/%s', ''),
}
# }}}

# intersphinx extension settings
intersphinx_mapping = {
    k: (v, os.getenv('SPHINX_%s_OBJECTS' % k.upper()))
    for k, v in {
        'click': 'https://click.palletsprojects.com/en/7.x/',
        'python': 'https://docs.python.org/3/',
    }.items()
}  # type: Dict[str, str]

# spelling extension settings
spelling_ignore_acronyms = False
spelling_lang = 'en_GB'
spelling_word_list_filename = '.meta/en.utf-8.add'
spelling_ignore_python_builtins = False
spelling_ignore_importable_modules = False

# napoleon extension settings
napoleon_numpy_docstring = False

# todo extension settings
todo_include_todos = True

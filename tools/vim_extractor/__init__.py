"""Basic ``vim`` script builder for Sphinx.

This works, and allows full out-of-tree builds.  However, it could do with some
work if it is to be used seriously.
"""

from sphinx.application import Sphinx

from .vim_builder import VimBuilder


def setup(app: Sphinx):
    app.add_builder(VimBuilder)

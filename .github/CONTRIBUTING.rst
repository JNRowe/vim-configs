Contributing
============

Pull requests are most welcome, but I’d appreciate it you could attempt to match
the style in the repository.

.. note::

    These are guidelines however, and as such can be broken if the need arises
    or you just want to convince me that your style is better.

For reStructuredText files:

* Wrap to 80 characters, unless there is a *good* reason not to
* Code block default to ``vim`` syntax, and don’t require a language marker

For Python files, please:

* `PEP 8`_, the style guide, should be followed where possible.
* `PEP 257`_, the docstring style guide, should be followed at all times
* While support for Python versions prior to v3.7 may be added in the future if
  such a need were to arise, you are encouraged to use v3.7 features now.
* All new classes and methods should be accompanied by Sphinx_
  ``autodoc``-compatible descriptions.

.. _PEP 8: http://www.python.org/dev/peps/pep-0008/
.. _PEP 257: http://www.python.org/dev/peps/pep-0257/
.. _Sphinx: http://sphinx.pocoo.org/

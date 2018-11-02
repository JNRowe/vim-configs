#! /usr/bin/python3
"""Extract vim code blocks from reST file.

This could be a lot more generic, but it has exactly *this* use and nothing
more.

"""

from argparse import ArgumentParser
from tempfile import NamedTemporaryFile

from docutils.core import publish_doctree
from docutils.nodes import Node
from docutils.parsers.rst import nodes, roles
from docutils.utils import DependencyList


def is_vim_code(node: Node):
    """Filter function to extract code blocks.

    .. note::

        This extracts plain literals and blocks marked as vim.  We can assume
        all plain literals are vim code, as we’ve set ``highlight_language`` in
        :file:`conf.py`.

    """
    if not node.tagname == 'literal_block':
        return False
    if node.attributes['classes'] == [] or 'vim' in node.attributes['classes']:
        return True


# Stub used Sphinx roles, as we’re not using them in output
for role in ('abbr', 'command', 'doc', 'file', 'kbd', 'ref'):
    roles.register_generic_role(role, nodes.comment)

p = ArgumentParser()
p.add_argument('-r')
p.add_argument('input')
p.add_argument('output')
args = p.parse_args()

settings = {}
if args.r:
    temp_fp = NamedTemporaryFile()
    settings['_disable_config'] = 1
    settings['record_dependencies'] = DependencyList(temp_fp.name)

with open(args.input) as f:
    doctree = publish_doctree(f.read(), args.input,
                              settings_overrides=settings)
if args.r:
    with open(args.r, 'w') as f:
        f.write(f'{args.output}: {temp_fp.read().decode()}')
    temp_fp.close()

code_blocks = doctree.traverse(condition=is_vim_code)

if len(code_blocks) >= 1:
    with open(args.output, 'w') as f:
        for block in code_blocks:
            f.write(block.astext() + '\n')

#! /usr/bin/python3
"""Extract vim code blocks from reST file.

This could be a lot more generic, but it has exactly *this* use and nothing
more.

"""

from argparse import ArgumentParser

from docutils.core import publish_doctree
from docutils.utils import DependencyList


def is_vim_code(node):
    return (node.tagname == 'literal_block'
            and 'vim' in node.attributes['classes'])


p = ArgumentParser()
p.add_argument('-r')
p.add_argument('input')
p.add_argument('output')
args = p.parse_args()

settings = {}
if args.r:
    settings['_disable_config'] = 1
    settings['record_dependencies'] = DependencyList(args.r)

with open(args.input) as f:
    doctree = publish_doctree(f.read(), args.input,
                              settings_overrides=settings)

code_blocks = doctree.traverse(condition=is_vim_code)

if len(code_blocks) >= 1:
    with open(args.output, 'w') as f:
        for block in code_blocks:
            f.write(block.astext() + '\n')
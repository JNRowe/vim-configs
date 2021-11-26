from docutils import nodes, writers, languages


# My preferred reST header adornments
REST_HEADINGS = [None, '=', '-', "'"]


class VimWriter(writers.Writer):
    supported = ('vim',)

    output = None

    def __init__(self, builder):
        writers.Writer.__init__(self)
        self.builder = builder
        self.translator_class = VimTranslator

    def translate(self):
        visitor = self.translator_class(self.document)
        self.document.walkabout(visitor)
        self.output = visitor.astext()


class VimTranslator(nodes.NodeVisitor):
    def __init__(self, document):
        nodes.NodeVisitor.__init__(self, document)
        self.settings = settings = document.settings
        lcode = settings.language_code
        self.language = languages.get_language(lcode, document.reporter)

        self.head = []
        self.body = []
        self.foot = []

        self.section_level = 0

    def astext(self):
        return ''.join(self.head + self.body + self.foot)

    def visit_literal_block(self, node):
        if node.attributes['language'] == 'vim':
            self.body.append(f'" {node.source}:{node.line}\n{node.astext()}\n')

    def visit_section(self, node):
        self.section_level += 1

    def depart_section(self, node):
        self.section_level -= 1

    def visit_title(self, node):
        if self.section_level == 1:
            fmt = '" {0}\n" {1}\n'
        else:
            if not any(
                node.attributes['language'] == 'vim'
                for n in node.children
                if isinstance(node, nodes.literal)
            ):
                raise nodes.SkipChildren
            fmt = '\n" {0}\n" {1}\n\n'
        self.body.append(
            fmt.format(
                node.astext(),
                REST_HEADINGS[self.section_level] * len(node.astext()),
            )
        )

    def unknown_departure(self, node):
        pass

    def unknown_visit(self, node):
        pass

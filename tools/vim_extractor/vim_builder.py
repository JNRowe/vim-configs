from os import path

from docutils.io import StringOutput
from sphinx.builders import Builder
from sphinx.util import logging
from sphinx.util.osutil import ensuredir, os_path

from .vim_writer import VimTranslator, VimWriter


logger = logging.getLogger(__name__)


class VimBuilder(Builder):
    name = 'vim'
    format = 'vim'
    epilog = 'The vim files are in %(outdir)s.'

    out_suffix = '.vim'
    allow_parallel = True
    _writer_class = VimWriter
    default_translator_class = VimTranslator

    current_docname = None

    def init(self):
        self.secnumbers = {}

    def get_outdated_docs(self):
        for docname in self.env.found_docs:
            if docname not in self.env.all_docs:
                yield docname
                continue
            targetname = path.join(self.outdir, docname)
            if docname != 'vimrc':
                targetname += self.out_suffix
            try:
                targetmtime = path.getmtime(targetname)
            except Exception:
                targetmtime = 0
            try:
                srcmtime = path.getmtime(self.env.doc2path(docname))
                if srcmtime > targetmtime:
                    yield docname
            except EnvironmentError:
                pass

    def get_target_uri(self, docname, typ=None):
        return ''

    def prepare_writing(self, docnames):
        self.writer = VimWriter(self)

    def write_doc(self, docname, doctree):
        self.current_docname = docname
        self.secnumbers = self.env.toc_secnumbers.get(docname, {})
        destination = StringOutput(encoding='utf-8')
        self.writer.write(doctree, destination)
        outname = os_path(docname)
        if docname != 'vimrc':
            outname += self.out_suffix
        outfilename = path.join(self.outdir, outname)
        ensuredir(path.dirname(outfilename))
        try:
            with open(outfilename, 'w', encoding='utf-8') as f:
                f.write(self.writer.output)
        except (IOError, OSError) as err:
            logger.warning('error writing file %s: %s', outfilename, err)

    def finish(self):
        pass

# -*- coding: utf-8 -*-


class Morph(object):

    def __init__(self, surface=None, base=None, pos=None, pos1=None):
        self.surface = surface
        self.base = base
        self.pos = pos
        self.pos1 = pos1

    def __str__(self):
        return '<surface: {0} base: {1}, pos: {2}, pos1: {3}>'.format(self.surface, self.base, self.pos, self.pos1)


class Chunk(object):

    def __init__(self, morphs=[], dst=None, srcs=[]):
        self.morphs = morphs
        self.dst = dst
        self.srcs = srcs

    def __str__(self):
        return '<text: {0}, srcs: {1}, dst: {2}>'.format(self.get_text(), str(self.srcs), self.dst)

    def get_text(self):
        return "".join(m.surface for m in self.morphs if m.pos != '記号')

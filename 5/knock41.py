# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/25

'''
41. 係り受け解析結果の読み込み（文節・係り受け）

40に加えて，文節を表すクラスChunkを実装せよ．
このクラスは形態素（Morphオブジェクト）のリスト（morphs），
係り先文節インデックス番号（dst），
係り元文節インデックス番号のリスト（srcs）をメンバ変数に持つこととする．
さらに，入力テキストのCaboChaの解析結果を読み込み，
１文をChunkオブジェクトのリストとして表現し，
8文目の文節の文字列と係り先を表示せよ．
第5章の残りの問題では，ここで作ったプログラムを活用せよ．
'''

class Morph:

    def __init__(self, surface, base, pos, pos1):
        
        self.surface = surface
        self.base    = base
        self.pos     = pos
        self.pos1    = pos1

class Chunk:

    def __init__(self, morphs, dst, srcs):

        self.morphs = morphs
        self.dst    = dst
        self.srcs   = srcs



def knock41():

    chunks_list = []
    chunks = {}
    morphs_list = []
    srcs = {}

    for line in open('../data/neko.cabocha', 'r'):
    
        if "\t" in line:
    
            surface, other = line.split("\t")
            elements = other.split(",")
            morph = Morph(surface, elements[6], elements[0], elements[1])
            chunks[chunk_no].append(morph)
    
        elif "EOS" in line:
    
            chunks_list.append(chunks)
                # Chunk(morphs, dst, srcs)
               
            chunks = {}
            srcs   = {}

        else:

            elements = line.split(" ")
            chunk_no = elements[1]
            dst      = elements[2][:-1]
            chunks[chunk_no] = list()

            if dst != '-1':

                try:

                    srcs[dst].append(chunk_no)

                except:

                    srcs[dst] = list()
                    srcs[dst].append(chunk_no)

            chunks[chunk_no].append(Chunk([], dst, srcs))

    return chunks_list




chunks_list = knock41()

print chunks_list[0]

chunk = chunk_list[7]



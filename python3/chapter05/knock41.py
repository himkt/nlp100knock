# -*- coding: utf-8 -*-

from core import Chunk, Morph
from collections import defaultdict

"""
41. 係り受け解析結果の読み込み（文節・係り受け）

40に加えて，文節を表すクラスChunkを実装せよ．
このクラスは
    形態素（Morphオブジェクト）のリスト（morphs），
    係り先文節インデックス番号（dst），
    係り元文節インデックス番号のリスト（srcs）
をメンバ変数に持つこととする．

さらに，入力テキストのCaboChaの解析結果を読み込み，
１文をChunkオブジェクトのリストとして表現し，
8文目の文節の文字列と係り先を表示せよ．
第5章の残りの問題では，ここで作ったプログラムを活用せよ．
"""


def parse():
    documents = list()
    chunk_list = list()  # list of Chunk
    srcs = defaultdict(list)

    with open('../data/neko.txt.cabocha') as text:

        for line in map(lambda l: l.rstrip(), text):

            if line == 'EOS':
                for chunk_id, srcs_local in srcs.items():
                    if chunk_id != -1:
                        chunk_list[chunk_id].srcs = srcs_local

                documents.append(chunk_list)
                chunk_list = []
                srcs = defaultdict(list)

            elif line.startswith('* '):
                _, chunk_id, dst, *_ = line.split()
                chunk_id = int(chunk_id)
                dst = int(dst.replace('D', ''))

                chunk_list.append(Chunk(morphs=[], dst=dst, srcs=[]))
                srcs[dst].append(chunk_id)

            else:
                surface, elements = line.split("\t")
                morph_info = elements.split(",")
                morph = Morph(
                    surface,
                    morph_info[6],
                    morph_info[0],
                    morph_info[1]
                )
                chunk_list[-1].morphs.append(morph)

    return documents

if __name__ == '__main__':
    for chunk in parse()[7]:
        print(' '.join(map(lambda morph: morph.__str__(), chunk.morphs)))

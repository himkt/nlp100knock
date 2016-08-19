# -*- coding: utf-8 -*-

"""
40. 係り受け解析結果の読み込み（形態素）

形態素を表すクラスMorphを実装せよ．
このクラスは
    表層形（surface），
    基本形（base），
    品詞（pos），
    品詞細分類1（pos1）
をメンバ変数に持つこととする．

さらに，CaboChaの解析結果（neko.txt.cabocha）を読み込み，
各文をMorphオブジェクトのリストとして表現し，
3文目の形態素列を表示せよ．
"""


from core import Morph


if __name__ == '__main__':
    morphs_list = []

    with open('../data/neko.txt.cabocha') as document:
        morphs = []

        for line in map(lambda l: l.rstrip(), document):
            elements = line.split("\t")
            surface = elements[0]

            if surface == 'EOS':
                if len(morphs) > 0:
                    morphs_list.append(morphs)

                morphs = []

            elif len(elements) > 1:
                morph_info = elements[1].split(",")
                morph = Morph(surface, morph_info[
                              6], morph_info[0], morph_info[1])

                morphs.append(morph)

    print("".join(map(lambda m: m.__str__(), morphs_list[8])))

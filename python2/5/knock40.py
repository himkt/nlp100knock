# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/24

'''
40. 係り受け解析結果の読み込み（形態素）

形態素を表すクラスMorphを実装せよ．
このクラスは表層形（surface），
基本形（base），品詞（pos），
品詞細分類1（pos1）をメンバ変数に持つこととする．
さらに，CaboChaの解析結果（neko.txt.cabocha）を読み込み，
各文をMorphオブジェクトのリストとして表現し，
3文目の形態素列を表示せよ．
'''


class Morph:

    def __init__(self, surface, base, pos, pos1):
        
        self.surface = surface
        self.base    = base
        self.pos     = pos
        self.pos1    = pos1


def knock40():

    morphs_list = []
    morphs = []

    for line in open('../data/neko.cabocha', 'r'):
    
        if "\t" in line:
    
            surface, other = line.split("\t")
            elements = other.split(",")
            morph = Morph(surface, elements[6], elements[0], elements[1])
            morphs.append(morph)
    
        elif "EOS" in line:
    
            if len(morphs) > 1: 
    
                morphs_list.append(morphs)
               
            morphs = []

    return morphs_list



if __name__ == '__main__':

    morphs_list = knock40()

    for morph in morphs_list[2]:

        print morph.surface,


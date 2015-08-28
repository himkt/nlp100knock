# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/22

'''
36. 単語の出現頻度

文章中に出現する単語とその出現頻度を求め，
出現頻度の高い順に並べよ．
'''

import knock30
import collections


def knock36(sentense_morph_list):

    word_list = []

    for morph_list in sentense_morph_list:

        for morph in morph_list:

            word_list.append(morph['base'])

    return collections.Counter(word_list)


if __name__ == '__main__':

    sentense_morph_list = knock30.knock30()
    count = knock36(sentense_morph_list)

    print count

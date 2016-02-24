# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/21

'''
32. 動詞の原形

動詞の原形をすべて抽出せよ．
'''

import knock30

sentense_morph_list = knock30.knock30()

for morph_list in sentense_morph_list:

    for morph in morph_list:

        if morph['pos'] == '動詞':

            print morph['base']

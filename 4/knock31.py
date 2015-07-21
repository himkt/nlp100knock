# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/21

'''
31. 動詞

動詞の表層形をすべて抽出せよ．
'''

import knock30

sentense_morph_list = knock30.knock30()

for morph_list in sentense_morph_list:

    for morph in morph_list:

        if morph['pos'] == '動詞':

            print morph['surface']

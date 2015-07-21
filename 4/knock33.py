# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/21

'''
33. サ変名詞

サ変接続の名詞をすべて抽出せよ．
'''

import knock30

sentense_morph_list = knock30.knock30()

for morph_list in sentense_morph_list:

    for morph in morph_list:

        if morph['pos'] == '名詞':

            if morph['pos1'] == 'サ変接続':

                # *は省いている
                if morph['base'] != '*': print morph['base']

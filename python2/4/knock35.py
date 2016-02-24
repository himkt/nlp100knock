# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/22

'''
35. 名詞の連接

名詞の連接（連続して出現する名詞）を最長一致で抽出せよ．
'''

import knock30

noun_junction_list = []

sentense_morph_list = knock30.knock30()

for morph_list in sentense_morph_list:

    noun_junction = []

    for morph in morph_list:

        if morph['pos'] == '名詞':

            noun_junction.append(morph['base'])

        else:
            
            if len(noun_junction) > 2:
                
                noun_junction_list.append(noun_junction)

            noun_junction = []


for noun_junction in noun_junction_list:

    for noun in noun_junction:

        print noun,

    print ""

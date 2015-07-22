# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/21

'''
34. 「AのB」

2つの名詞が「の」で連結されている名詞句を抽出せよ．
'''

import knock30

sentense_morph_list = knock30.knock30()

for morph_list in sentense_morph_list:

    for index in xrange(len(morph_list)):
        
        try:
            
            cond1 = morph_list[index+1]['surface'] == 'の'
            cond2 = morph_list[index]['pos']   == '名詞'
            cond3 = morph_list[index+2]['pos'] == '名詞'

            if cond1 and cond2 and cond3:

                print "%s%s%s" % (morph_list[index]['surface'], morph_list[index+1]['surface'], morph_list[index+2]['surface'])

        except:

            break


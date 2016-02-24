# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
25. テンプレートの抽出

記事中に含まれる「基礎情報」テンプレートの
フィールド名と値を抽出し，
辞書オブジェクトとして格納せよ．
'''

import re

template = {}
flag = False

for line in open('../data/jawiki-country-uk.txt', 'r'):
    
    if re.search(r"^{{基礎情報", line):
        flag = True
        continue

    if re.search(r"^}}", line):
        break
    
    if flag:
        reg = re.search(r"\|(.*?)\s=\s(.*)", line)
        
        if reg:

            elements = reg.groups()
            template[elements[0]] = elements[1]

        else:

            template[elements[0]] += line

for key, value in template.items():
    print "%s = %s" % (key, value)

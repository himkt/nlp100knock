# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
26. 強調マークアップの除去

25の処理時に，
テンプレートの値からMediaWikiの強調マークアップ
（弱い強調，強調，強い強調のすべて）
を除去してテキストに変換せよ
（参考: マークアップ早見表）．
'''

import re

template = {}
flag = False

for line in open('../data/jawiki-country-uk.txt', 'r'):
    
    line = line.replace('\'', '')

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

# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
23. セクション構造

記事中に含まれるセクション名と
そのレベル（例えば"== セクション名 =="なら1）を表示せよ．
'''

import re

for line in open('../data/jawiki-country-uk.txt', 'r'):
    reg = re.search(re.compile(u"^(=+)(.*?)(=+)"), line)
    if reg:
        elements = reg.groups()
        print "%s %s" % (len(elements[0]), elements[1])

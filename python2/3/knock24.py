# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
24. ファイル参照の抽出

記事から参照されているメディアファイルをすべて抜き出せ．
'''

import re

for line in open('../data/jawiki-country-uk.txt', 'r'):
    reg = re.search(re.compile(u"^\[\[File:(.*?)\|(.*)\]\]"), line)
    if reg:
        elements = reg.groups()
        print "%s" % elements[0]

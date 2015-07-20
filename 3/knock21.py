# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
21. カテゴリ名を含む行を抽出

記事中でカテゴリ名を宣言している行を抽出せよ．
'''

for line in open('../data/jawiki-country-uk.txt', 'r'):
    if re.search(re.compile(u"\[\[Category\:(.*?)\]\]"), line):
        print line

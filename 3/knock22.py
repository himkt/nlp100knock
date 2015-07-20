# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
22. カテゴリ名の抽出

記事のカテゴリ名を（行単位ではなく名前で）抽出せよ．
'''

for line in open('../data/jawiki-country-uk.txt', 'r'):
    con = re.search(re.compile(u"\[\[Category\:(.*?)\]\]"), line)
    if con:
        print con.group(1)

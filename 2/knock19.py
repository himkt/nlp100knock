# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
19. 各行の1コラム目の文字列の出現頻度を求め，出現頻度の高い順に並べる

各行の1列目の文字列の出現頻度を求め，
その高い順に並べて表示せよ．
確認にはcut, uniq, sortコマンドを用いよ．
'''

import collections

string_arr = []

for line in open('../data/hightemp.txt', 'r'):
    string_arr.append(line.split("\t")[0])

for item in collections.Counter(string_arr).most_common():
    print "%s %s" % (item[1], item[0])


# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
17. １列目の文字列の異なり

1列目の文字列の種類（異なる文字列の集合）を求めよ．
確認にはsort, uniqコマンドを用いよ．
'''

uniq_string = []

for line in open('../data/hightemp.txt', 'r'):
    string = line.split("\t")[0]
    if string not in uniq_string:
        uniq_string.append(string)

print len(uniq_string)

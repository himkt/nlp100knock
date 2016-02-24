# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
18. 各行を3コラム目の数値の降順にソート

各行を3コラム目の数値の逆順で整列せよ
（注意: 各行の内容は変更せずに並び替えよ）．
確認にはsortコマンドを用いよ
（この問題はコマンドで実行した時の結果と合わなくてもよい）．
'''

data = []

for line in open('../data/hightemp.txt', 'r'):
    data.append(line.split("\t"))

data = sorted(data, key=lambda x:x[2], reverse=True)

for line in data:
    print "%s %s %s %s" % (line[0], line[1], line[2], line[3]),

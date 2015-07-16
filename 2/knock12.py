# -*- coding: utf-8 -*-
# @author = himkt
# 2015/07/16

'''
12. 1列目をcol1.txtに，2列目をcol2.txtに保存

各行の1列目だけを抜き出したものをcol1.txtに，
2列目だけを抜き出したものをcol2.txtとしてファイルに保存せよ．
確認にはcutコマンドを用いよ．
'''

f = open('../data/hightemp.txt', 'r')

f_col1 = open('./col1.txt','w')
f_col2 = open('./col2.txt','w')

for line in f:
    col1, col2, temperature, timestamp = line.split("\t")#.decode('utf-8').split("\t")
    f_col1.write("%s\n" % col1)#.encode('utf-8'))
    f_col2.write("%s\n" % col2)#.encode('utf-8'))

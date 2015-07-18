# -*- coding: utf-8 -*-

'''
14. 先頭からN行を出力

自然数Nをコマンドライン引数などの手段で受け取り，
入力のうち先頭のN行だけを表示せよ．
確認にはheadコマンドを用いよ．
'''

n = int(raw_input())
f = open('../data/hightemp.txt','r')

for line, index in zip(f,xrange(n)):
    print line,
    if n == index: break


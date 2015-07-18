# -*- coding: utf-8 -*-
# @create = 2015/07/19
# @modify = 2015/07/19

'''
14. 先頭からN行を出力

自然数Nをコマンドライン引数などの手段で受け取り，
入力のうち先頭のN行だけを表示せよ．
確認にはheadコマンドを用いよ．
'''

import sys

argvs = sys.argv
n = int(argvs[1])
f = open('../data/hightemp.txt','r')

for line, index in zip(f,xrange(n)):
    print line,
    if n == index: break


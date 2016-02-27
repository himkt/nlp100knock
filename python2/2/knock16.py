# -*- coding: utf-8 -*-
# @create = 2015/07/19
# @modify = 2015/07/19

'''
16. ファイルをN分割する

自然数Nをコマンドライン引数などの手段で受け取り，
入力のファイルを行単位でN分割せよ．
同様の処理をsplitコマンドで実現せよ．
'''

import sys
import math

argvs = sys.argv
n = int(argvs[1])
f = open('../data/hightemp.txt', 'r')

f_arr          = f.read().rstrip().split("\n")
each_file_size = int(math.ceil(float(len(f_arr))/n))

for file_index in xrange(n):
    w = open("./hightemp%s.txt" % str(file_index+1),'w')
    for index in xrange(each_file_size):
        try:
            w.write("%s\n" % f_arr[index+file_index*each_file_size])
        except:
            exit()

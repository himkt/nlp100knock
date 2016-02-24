# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/29

'''
51. 単語の切り出し

空白を単語の区切りとみなし，
50の出力を入力として受け取り，
1行1単語の形式で出力せよ．
ただし，文の終端では空行を出力せよ．
''' 

from knock50 import knock50
import re

def knock51(sentense):
    return [re.sub("\.|\,|\'|\(|\)","", i) for i in sentense.split()]

if __name__ == '__main__':

    text = open("../data/nlp.txt", "r")
    sentenses = knock50(text)
    
    for sentense in sentenses:
        for word in knock51(sentense):
            print word


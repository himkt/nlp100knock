# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/27

'''
50. 文区切り

(. or ; or : or ? or !)
→ 空白文字 
→ 英大文字というパターンを文の区切りと見なし，
入力された文書を1行1文の形式で出力せよ．
''' 

import re

def knock50(text):

    sentenses = []
    
    for line in text:
        item = re.split(r"(\.|;|\:|\?|\!) ([A-Z])", line.rstrip())
        if len(item) > 1:
            sentenses.append("%s%s" % (item.pop(0), item.pop(0)))
            for i in xrange(len(item)/3):
                sentenses.append("%s%s%s" % (item[3*i],item[3*i+1],item[3*i+2]))
        elif len(item) == 1:
            if item[0] != '':
                sentenses.append(item[0])

    return sentenses


if __name__ == '__main__':

    text = open("../data/nlp.txt", "r")
    sentenses = knock50(text)
    
    for sentense in sentenses:
        print sentense

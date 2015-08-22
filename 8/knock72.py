# -*- coding: utf-8 -*-

'''
72. 素性抽出

極性分析に有用そうな素性を各自で設計し，
学習データから素性を抽出せよ．
素性としては，レビューからストップワードを除去し，
各単語をステミング処理したものが最低限のベースラインとなるであろう．
'''

import re
import numpy
from nltk.corpus import stopwords
from stemming.porter2 import stem

def knock72():

    features = []
    
    for line in open('../data/sentiment.txt', 'r'):
        label = line[:2]
        words = [word.lower() for word in re.sub("[\.\,\!\?;\:\(\)\[\]\'\"]$", '', line[3:].rstrip()).split()]
        for word in words:
            features.append([label,stem(word)])

    return numpy.array(features)


if __name__ == '__main__':

    features = knock72()
    
    print len([feature for feature in features if feature[0] == '-1'])
    print len([feature for feature in features if feature[0] == '+1'])

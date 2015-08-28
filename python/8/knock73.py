# -*- coding: utf-8 -*-

'''

72で抽出した素性を用いて、
ロジスティック回帰モデルを学習せよ．
'''

import numpy
from knock72 import knock72
from sklearn import linear_model

def knock73(features):

    features = numpy.array(features)
    words = list(set(features[:,1]))
    
    pos_vec = numpy.zeros(len(words))
    neg_vec = numpy.zeros(len(words))

    for feature in features:
        index = words.index(feature[1])
        if feature[0] == '-1':
            pos_vec[index] += 1
        else:
            neg_vec[index] += 1

    logit_model = linear_model.LogisticRegression()
    logit_model.fit([pos_vec,neg_vec],[1,-1])

    return (words,logit_model)


if __name__ == '__main__':

    logit = linear_model.LogisticRegression()
    features = knock72()
    knock73(features)

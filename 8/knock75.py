# -*- coding: utf-8 -*-

'''
75. 素性の重み

73で学習したロジスティック回帰モデルの中で，
重みの高い素性トップ10と，
重みの低い素性トップ10を確認せよ．
'''

import numpy
from knock72 import knock72,stemming
from knock73 import knock73
from sklearn import linear_model


if __name__ == '__main__':

    features = knock72()
    knock73_instance = knock73(features)
    words = knock73_instance[0]
    logit_model = knock73_instance[1]

    print logit_model.class_weight


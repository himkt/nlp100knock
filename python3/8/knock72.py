# -*- coding: utf-8 -*-

from knock70 import init
from sklearn.feature_extraction.text import CountVectorizer
from numpy import array, shape


'''
72. 素性抽出

極性分析に有用そうな素性を各自で設計し，
学習データから素性を抽出せよ．
素性としては，レビューからストップワードを除去し，
各単語をステミング処理したものが最低限のベースラインとなるであろう．
'''


def vectorize(features):
    X = list()
    y = list()
    cv = CountVectorizer()

    for feature in features:
        y.append(1 if feature[0:2] == '+1' else 0)
        X.append(feature[3:])

    X = cv.fit_transform(X)
    y = array([y]).T
    return (X.toarray(), y)


if __name__ == '__main__':
    features = init()
    X, y = vectorize(features)
    print(X, y)

    print(shape(X))

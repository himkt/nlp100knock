# -*- coding: utf-8 -*-

from knock70 import init
from knock72 import vectorize
from numpy import shape, exp
from numpy.random import random


'''
73. 学習

72で抽出した素性を用いて、
ロジスティック回帰モデルを学習せよ．
'''


def h(W, X):
    z = W.T.dot(X.toarray().T)
    return 1 / (1 + exp(z))


def grad(W, X, y):
    return (h(W, X) - y).dot(X.toarray()).reshape((shape(X)[1], 1))


if __name__ == '__main__':
    features = init()
    X, y = vectorize(features)
    W = random(shape(X)[1]).reshape(shape(X)[1], 1)

    for i in range(10):
        W -= 0.001 * (grad(W, X, y))

    print(W)

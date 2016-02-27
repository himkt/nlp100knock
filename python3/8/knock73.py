# -*- coding: utf-8 -*-

from knock70 import init
from knock72 import vectorize
from numpy import shape, exp, log
from numpy.random import random


'''
73. 学習

72で抽出した素性を用いて、
ロジスティック回帰モデルを学習せよ．
'''


def J(W, X, y):
    return y.T.dot(log(h(W, X))) + (1-y).T.dot(log(1-h(W, X)))


def h(W, X):
    z = X.dot(W)
    return 1 / (1 + exp(z))


def grad(W, X, y):
    return X.T.dot(h(W, X) - y)


def check_convergence(W, W_tmp, X, y):
    return abs(J(W, X, y)) - J(W_tmp, X, y) < 0.1


if __name__ == '__main__':
    features = init()
    X, y = vectorize(features)
    W = random(shape(X)[1]).reshape(shape(X)[1], 1)

    for i in range(10):
        W_tmp = W
        W = W + 0.01 * grad(W, X, y)

        if check_convergence(W, W_tmp, X, y):
            break

    print(W)

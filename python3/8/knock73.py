# -*- coding: utf-8 -*-

from knock70 import init
from knock72 import vectorize


'''
73. 学習

72で抽出した素性を用いて、
ロジスティック回帰モデルを学習せよ．
'''

# ロジスティック回帰は単語レベルじゃなくて文章レベルか


if __name__ == '__main__':
    features = init()
    X, y = vectorize(features)

    print(X)

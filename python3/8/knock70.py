# -*- coding: utf-8 -*-

from random import shuffle
from stemming.porter2 import stem


'''
70. データの入手・整形

文に関する極性分析の正解データを用い，以下の要領で正解データ（sentiment.txt）を作成せよ．
rt-polarity.posの各行の先頭に"+1 "という文字列を追加する（極性ラベル"+1"とスペースに続けて肯定的な文の内容が続く）
rt-polarity.negの各行の先頭に"-1 "という文字列を追加する（極性ラベル"-1"とスペースに続けて否定的な文の内容が続く）
上述1と2の内容を結合（concatenate）し，行をランダムに並び替える
sentiment.txtを作成したら，正例（肯定的な文）の数と負例（否定的な文）の数を確認せよ
'''


def init():
    pos = (["+1 %s" % " ".join(
        map(lambda w: stem(w), line.rstrip().split())) for line in open(
            "../data/rt-polaritydata/rt-polarity.pos")])

    neg = (["-1 %s" % " ".join(
        map(lambda w: stem(w), line.rstrip().split())) for line in open(
            "../data/rt-polaritydata/rt-polarity.neg")])

    res = pos + neg
    shuffle(res)
    return res

if __name__ == '__main__':
    features = init()

    neg_size = len(list(filter(lambda x: x[0] == '-', features)))
    pos_size = len(features) - neg_size

    print(pos_size)
    print(neg_size)

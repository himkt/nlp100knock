# -*- coding: utf-8 -*-

from knock70 import init
from nltk.corpus import stopwords


'''
71. ストップワード

英語のストップワードのリスト（ストップリスト）を適当に作成せよ．
さらに，引数に与えられた単語（文字列）がストップリストに含まれている場合は真，
それ以外は偽を返す関数を実装せよ．さらに，その関数に対するテストを記述せよ．
'''


def contain_stop(stopwords, word):
    return word in stopwords


def get_stopwords():
    return stopwords.words('english') + [',', '.', ';', ':', '']


if __name__ == '__main__':
    features = init()
    stopword_list = get_stopwords()

    for sentence in features:
        for word in sentence.split(' '):
            print(contain_stop(stopword_list, word))

# -*- coding: utf-8 -*-

from knock70 import init
from nltk.corpus import stopwords


def contain_stop(stopwords, word):
    return word in stopwords


if __name__ == '__main__':
    features = init()
    stopwords = stopwords.words('english') + [',', '.', ';', ':', '']

    for sentence in features:
        for word in sentence.split(' '):
            print(contain_stop(stopwords, word))

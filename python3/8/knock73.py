# -*- coding: utf-8 -*-

from knock70 import init
from knock72 import extract_features
from nltk.corpus import stopwords
from collections import Counter
from numpy import exp, array, ones


# ロジスティック回帰は単語レベルじゃなくて文章レベルか


if __name__ == '__main__':
    features = init()
    stopwords = stopwords.words('english') + [',', '.', ';', ':', '']
    filtered_features = extract_features(features, stopwords)


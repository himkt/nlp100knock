# -*- coding: utf-8 -*-

from knock70 import init
from knock71 import contain_stop
from nltk.corpus import stopwords
from stemming.porter2 import stem
from collections import Counter
from gensim.corpora import Dictionary


def dictionalize(features):
    return Dictionary(list(map(lambda x: x.split(' '), features)))


def extract_features(features, stopwords):
    result = {'+1': list(), '-1': list()}
    corpus = list()

    for feature in features:
        label = feature[0:2]
        sentence = feature[2:]
        feature_vec = Counter([stem(word) for word in sentence.split(' ') if not contain_stop(stopwords, stem(word))])

        corpus += list(feature_vec.keys())
        result[label].append(feature_vec)

    return (result, set(corpus))


if __name__ == '__main__':
    features = init()
    dictionary = dictionalize(features)

    stopwords = stopwords.words('english') + [',', '.', ';', ':', '']
    filtered_features = extract_features(features, stopwords)

    print(dictionary)

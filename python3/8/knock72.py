# -*- coding: utf-8 -*-

from knock70 import init
from knock71 import contain_stop
from nltk.corpus import stopwords
from stemming.porter2 import stem
from collections import Counter


def extract_features(features, stopwords):
    result = {'+1': list(), '-1': list()}

    for feature in features:
        label = feature[0:2]
        sentence = feature[2:]
        feature_vec = Counter([stem(word) for word in sentence.split(' ') if not contain_stop(stopwords, stem(word))])
        result[label].append(feature_vec)

    return result


if __name__ == '__main__':
    features = init()
    stopwords = stopwords.words('english') + [',', '.', ';', ':', '']
    filtered_features = extract_features(features, stopwords)

    print(filtered_features)

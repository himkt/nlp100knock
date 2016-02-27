# -*- coding: utf-8 -*-

from knock70 import init
from sklearn.feature_extraction.text import CountVectorizer
from numpy import array


def vectorize(features):
    y = list()
    X = list()
    for feature in features:
        y.append(1 if feature[0:2] == '+1' else -1)
        X.append(feature[3:])

    cv = CountVectorizer()
    X = cv.fit_transform(X)
    y = array(y)

    return (X, y)

if __name__ == '__main__':
    features = init()
    X, y = vectorize(features)
    print(X, y)

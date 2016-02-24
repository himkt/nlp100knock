# -*- coding: utf-8 -*-

from knock70 import init
from knock71 import contain_stop
from nltk.corpus import stopwords
from stemming.porter2 import stem


def extract_features(features, stopwords):
    result = {'pos': list(), 'neg': list()}

    for feature in features:
        label = feature[0:2]
        sentence = feature[2:]

        for word in sentence.split(' '):
            word = stem(word)
            if not contain_stop(stopwords, word):
                if label == '+1':
                    result['pos'].append(word)
                else:
                    result['neg'].append(word)

    return result


if __name__ == '__main__':
    features = init()
    stopwords = stopwords.words('english') + [',', '.', ';', ':', '']
    filtered_features = extract_features(features, stopwords)

    print(filtered_features)

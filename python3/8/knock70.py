# -*- coding: utf-8 -*-

from random import shuffle


def init():
    pos = (["+1 %s" % line.rstrip() for line in open("../data/rt-polaritydata/rt-polarity.pos")])
    neg = (["-1 %s" % line.rstrip() for line in open("../data/rt-polaritydata/rt-polarity.neg")])
    res = pos + neg

    shuffle(res)
    return res

if __name__ == '__main__':
    features = init()

    neg_size = len(list(filter(lambda x: x[0] == '-', features)))
    pos_size = len(features) - neg_size

    print(pos_size)
    print(neg_size)

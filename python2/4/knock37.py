# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/22

'''
37. 頻度上位10語

出現頻度が高い10語とその出現頻度をグラフ（例えば棒グラフなど）で表示せよ．
'''

import knock30
import knock36
import collections
import numpy
import matplotlib.pyplot as plt


if __name__ == '__main__':

    sentense_morph_list = knock30.knock30()
    count = knock36.knock36(sentense_morph_list)
    data = numpy.array(count.most_common(10))

    Px = range(len(data))
    Py = map(lambda y: int(y), data[:,1])

    plt.xticks(Px, map(lambda x: x.decode('utf-8'), data[:,0]))
    plt.bar(Px, Py)

    # 日本語出力失敗: ファイルに保存する場合のみ
    # plt.show()は成功する
    # plt.savefig("knock37.eps", dpi=150)
    plt.show()


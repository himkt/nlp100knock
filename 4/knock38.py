# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/24

'''
38. ヒストグラム

単語の出現頻度のヒストグラム
（横軸に出現頻度，縦軸に出現頻度をとる単語の種類数を棒グラフで表したもの）
を描け．
'''

import knock30
import knock36
import collections
import numpy
import matplotlib.pyplot as plt


if __name__ == '__main__':

    sentense_morph_list = knock30.knock30()
    count = knock36.knock36(sentense_morph_list)
    count_total = {}

    for count, freq in count.items():

        if freq in count_total.keys():
        
            count_total[freq] += 1

        else:

            count_total[freq] = 1


    Px = numpy.array(count_total.keys())
    Py = numpy.array(count_total.values())

    plt.xlim([0,100])
    
    plt.bar(Px, Py)
    plt.show()

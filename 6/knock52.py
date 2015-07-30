# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/29

'''
52. ステミング

51の出力を入力として受け取り，
Porterのステミングアルゴリズムを適用し，
単語と語幹をタブ区切り形式で出力せよ． 
Pythonでは，Porterのステミングアルゴリズムの実装として
stemmingモジュールを利用するとよい．
''' 

from knock50 import knock50
from knock51 import knock51
from stemming.porter2 import stem


if __name__ == '__main__':

    text = open("../data/nlp.txt", "r")
    sentenses = knock50(text)
    
    for sentense in sentenses:
        for word in knock51(sentense):
            print stem(word)


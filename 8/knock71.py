# -*- coding: utf-8 -*-

'''
71. ストップワード

英語のストップワードのリスト（ストップリスト）を適当に作成せよ．
さらに，引数に与えられた単語（文字列）がストップリストに含まれている場合は真，
それ以外は偽を返す関数を実装せよ．さらに，その関数に対するテストを記述せよ．
'''

import re
from nltk.corpus import stopwords

def knock71(sentence):
    stop_list = ['is', 'am', 'be', 'I', 'you', 'he', 'she']
    words = [word.lower() for word in re.sub("[\.\,\!\?;\:\(\)\[\]\'\"]$", '', sentence.rstrip()).split()]
    result = set(words).intersection(set(stopwords.words('english')))
    return True if len(result) != 0 else False


print knock71("I am a pen.")

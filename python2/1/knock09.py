# -*- coding: utf-8 -*-

'''
09. Typoglycemia

スペースで区切られた単語列に対して，
各単語の先頭と末尾の文字は残し，
それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．
ただし，長さが４以下の単語は並び替えないこととする．
適当な英語の文
（例えば"I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."）
を与え，その実行結果を確認せよ．
'''

import random

input_text = u"I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."


def typoglycemia(string):
    input_text_to_arr = input_text.split()
	
    for word in input_text_to_arr:
        if len(word) > 4:
            top = word[0]
            tail = word[-1]
            text_list = list(word[1:-1])
            random.shuffle(text_list)
            print "%s%s%s" % (top, ''.join(text_list), tail),

        else:
            print word,


typoglycemia(input_text)

# -*- coding: utf-8 -*-

'''
05. n-gram

与えられたシーケンス（文字列やリストなど）から
n-gramを作る関数を作成せよ．
この関数を用い，
"I am an NLPer"という文から単語bi-gram，
文字bi-gramを得よ．
'''



def ngram(n, mode, string):

    if mode == 'char':
        feature_list = [char for char in string]
    else:
        feature_list = string.split()

    ngram_list = []
    for i in xrange(len(feature_list) - n+1):
        temp_ngram_list = []
        for j in xrange(n):
            temp_ngram_list.append(feature_list[i+j])
            
        ngram_list.append(''.join(temp_ngram_list))
    return ngram_list


if __name__ == '__main__':
    # n = raw_input("n: ").decode("utf-8")
    n = 2
    string = "I am an NLPer"
    # string = raw_input("string: ").decode('utf-8')
    # mode = raw_input("mode: ").decode('utf-8')
    print(ngram(n, 'word', string))
    print(ngram(n, 'char', string))

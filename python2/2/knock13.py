# -*- coding: utf-8 -*-
# @author = himkt
# 2015/07/17

'''
13. col1.txtとcol2.txtをマージ

12で作ったcol1.txtとcol2.txtを結合し，
元のファイルの1列目と2列目をタブ区切りで並べたテキストファイルを作成せよ．
確認にはpasteコマンドを用いよ．
'''

f_col1 = open('./col1.txt','r')
f_col2 = open('./col2.txt','r')

for col1, col2 in zip(f_col1, f_col2):
    print "%s\t%s" % (col1.rstrip(),col2.rstrip())


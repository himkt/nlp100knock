# -*- coding: utf-8 -*-
# knock10.py
# @author = himkt
# 2015/07/16

'''
11. タブをスペースに置換

タブ1文字につきスペース1文字に置換せよ．
確認にはsedコマンド，trコマンド，
もしくはexpandコマンドを用いよ．
'''

f = open('../data/hightemp.txt', 'r')

for line in f:
    print line.replace("\t", " ")

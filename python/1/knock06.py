# -*- coding: utf-8 -*-
import knock05 as kn5

'''
06. 集合

"paraparaparadise"と"paragraph"に
含まれる文字bi-gramの集合を，
それぞれ, XとYとして求め，
XとYの和集合，積集合，差集合を求めよ．
さらに，'se'というbi-gramがXおよびYに含まれるかどうかを調べよ．
'''

str1 = "paraparaparadise"
str2 = "paragraph"

n = 2
mode = "char"

bigram1_set = set(kn5.ngram(n,mode,str1))
bigram2_set = set(kn5.ngram(n,mode,str2))

print "和集合 ->%s" % (bigram1_set | bigram2_set)
print "積集合 ->%s" % (bigram1_set & bigram2_set)
print "差集合(1)-(2) -> %s" % (bigram1_set - bigram2_set)
print "差集合(2)-(1) -> %s" % (bigram2_set - bigram1_set)


print 'se' in bigram1_set
print 'se' in bigram2_set

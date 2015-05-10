# -*- coding: utf-8 -*-
require './05'


=begin
"paraparaparadise"と"paragraph"に含まれる文字bi-gramの集合を
それぞれ,XとYとして求め，
XとYの和集合，積集合，差集合を求めよ．
さらに，'se'というbi-gramがXおよびYに含まれるかどうかを調べよ．
=end

str1 = "paraparaparadise"
str2 = "paragraph"

arr1 = Nlp05.char(str1)
arr2 = Nlp05.char(str2)

p (arr1 + arr2).uniq # union
p ((arr2 - arr1) + (arr1 - arr2)) # diff
p arr2.product(arr1) # product


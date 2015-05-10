# -*- coding: utf-8 -*-

=begin
与えられたシーケンス（文字列やリストなど）からn-gramを作る関数を作成せよ．
この関数を用い，"I am an NLPer"という文から単語bi-gram，文字bi-gramを得よ．
=end

module Nlp05
  module_function

  def word(str)
    arr = str.split(" ")
    bigram(arr)
  end

  def char(str)
    arr = str.gsub(' ','').split(//)
    bigram(arr)
  end

  def bigram(arr)
    i = 0
    data = Array.new
    arr.size.times do
      data.push("#{arr[i]}, #{arr[i+1]}") if arr[i+1]
      i += 1
    end
    return data
  end
end

str = "I am an NLPer"
if $0 == __FILE__
  p Nlp05.word(str)
  p Nlp05.char(str)
end

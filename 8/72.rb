# -*- coding: utf-8 -*-
require 'stemmify'
require './71'

=begin
極性分析に有用そうな素性を各自で設計し，
学習データから素性を抽出せよ．
素性としては，レビューからストップワードを除去し，
各単語をステミング処理したものが最低限のベースラインとなるであろう．
=end

pos_vector = Hash.new
neg_vector = Hash.new
stop_list = make_stop_list

File.foreach('../data/sentiment.utf8.txt') do |line|
  
  # 各行の先頭の'+1'or'-1'を取得する
  attr = line[0...2]
  
  # 本文に対して単語区切り(半角スペースで区切る)を行いeach
  line[3...line.size].chomp.split(/\s/).each do |word|
    if attr == '+1'
      unless stop?(word,stop_list)
        word = word.stem
        pos_vector[word] = 0 unless pos_vector[word]
        pos_vector[word] += 1
      end
    else
      unless stop?(word,stop_list)
        word = word.stem
        neg_vector[word] = 0 unless neg_vector[word]
        neg_vector[word] += 1
      end
    end
  end
end

# TODO: ネガポジに頻出する単語を素性にしないように

if $0 == __FILE__

  out = open('../data/features.tsv','w')
  
  pos_vector.each do |key,value|
    out.puts "1\t#{key}\t#{value}"
  end
  neg_vector.each do |key,value|
    out.puts "-1\t#{key}\t#{value}"
  end

  out.close
end

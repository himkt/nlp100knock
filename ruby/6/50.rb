# -*- coding: utf-8 -*-

=begin
(. or ; or : or ? or !) → 空白文字 → 英大文字というパターンを文の区切りと見なし，入力された文書を1行1文の形式で出力せよ
=end

open('../data/nlp.txt', 'r') do |input|
  text = input.read
  text.scan(/[A-Z].*?(?:\.|\,|!|\?)\s/).each do |sentense|
    puts sentense
  end
end

# -*- coding: utf-8 -*-

=begin
スペースで区切られた単語列に対して，各単語の先頭と末尾の文字は残し，
それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．
ただし，長さが４以下の単語は並び替えないこととする．
適当な英語の文（例えば"I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."）を与え，
その実行結果を確認せよ．
=end

str1 = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
str2 = ""

str1.split(" ").each do |word|
  arr = word.split(//)
  if arr.size > 4
    h = arr.shift
    f = arr.pop
    c = arr.shuffle
    c.unshift(h)
    c.push(f)
    str2 += "#{c.join} "
  else
    str2 += "#{arr.join} "
  end
end

puts str2

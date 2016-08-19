# -*- coding: utf-8 -*-

=begin
"Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
という文を単語に分解し，
各単語の（アルファベットの）文字数を先頭から出現順に並べたリストを作成せよ．
=end

str = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."

list = {}

str.split(" ").each do |word|
  list[word] = word.size
end

p list

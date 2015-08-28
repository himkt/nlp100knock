# -*- coding: utf-8 -*-

=begin
自然数Nをコマンドライン引数などの手段で受け取り，
入力のうち末尾のN行だけを表示せよ．
確認にはtailコマンドを用いよ．
=end

N = ARGV[0].to_i
str = ''

open('../../data/hightemp.txt', 'r') do |input|
  while line = input.gets
    str += line
  end
end

arr = str.split("\n")
i = N

N.times do
  puts arr[arr.size-i]
  i -= 1
end

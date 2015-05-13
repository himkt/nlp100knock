# -*- coding: utf-8 -*-

=begin
自然数Nをコマンドライン引数などの手段で受け取り
入力のファイルを行単位でN分割せよ．
同様の処理をsplitコマンドで実現せよ．
=end

N = ARGV[0].to_i
str = ''

open('../../data/hightemp.txt', 'r') do |input|
  while line = input.gets
    str += line
  end
end

i = 1
arr = str.split("\n")

N.times do
  # floor: 切り捨て, ceil: 切り上げ, round: 四捨五入
  (arr.size.to_f / N).ceil.times do
    open("../../data/2_16/16-out-#{i}.txt", 'w') do |output|
      output.print "#{arr.shift}\n"
    end
  end
  i += 1
end

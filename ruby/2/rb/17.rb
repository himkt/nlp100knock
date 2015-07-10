# -*- coding: utf-8 -*-

=begin
1列目の文字列の種類（異なる文字列の集合）を求めよ．
確認にはsort, uniqコマンドを用いよ．
=end

dict = Hash.new

File.foreach('../../data/hightemp.txt') do |line|
  line.split(/\t/).each do |elem|
    dict[elem] = 0 unless dict[elem]
    dict[elem] += 1
    break
  end
end

p dict.size

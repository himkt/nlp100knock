# -*- coding: utf-8 -*-

=begin
各行の1列目の文字列の出現頻度を求め，
その高い順に並べて表示せよ．
確認にはcut, uniq, sortコマンドを用いよ．
=end

dict = Hash.new

File.foreach('../../data/hightemp.txt') do |line|
  line.split(/\t/).each do |elem|
    dict[elem] = 0 unless dict[elem]
    dict[elem] += 1
    break
  end
end

dict.sort{|(k1,v1),(k2,v2)| v2 <=> v1}.each do |pref,count|
  puts "#{count} #{pref}"
end

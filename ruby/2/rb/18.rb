# -*- coding: utf-8 -*-

=begin
各行を3コラム目の数値の逆順で整列せよ（注意: 各行の内容は変更せずに並び替えよ）
確認にはsortコマンドを用いよ
（この問題はコマンドで実行した時の結果と合わなくてもよい）．
=end

list = Hash.new

File.foreach('../../data/hightemp.txt') do |line|
  temp = line.split(/\t/)[2].to_f
  list[line] = temp
end

list.sort{|(k1,v1),(k2,v2)| v2<=>v1}.each do |pref,temp|
  puts pref
end

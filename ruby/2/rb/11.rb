# -*- coding: utf-8 -*-

=begin
タブ1文字につきスペース1文字に置換せよ．
確認にはsedコマンド，trコマンド，もしくはexpandコマンドを用いよ．
=end

open('../../data/hightemp.txt', 'r') do |input|
  while line = input.gets
    puts line.gsub(/\t/, ' ')
  end
end

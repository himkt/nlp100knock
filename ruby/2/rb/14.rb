# -*- coding: utf-8 -*-

=begin
自然数Nをコマンドライン引数などの手段で受け取り，
入力のうち先頭のN行だけを表示せよ．
確認にはheadコマンドを用いよ
=end

N = ARGV[0].to_i

open('../../data/hightemp.txt', 'r') do |input|
  N.times do
    puts input.gets.chomp
  end
end

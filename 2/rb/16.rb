# -*- coding: utf-8 -*-

=begin
自然数Nをコマンドライン引数などの手段で受け取り
入力のファイルを行単位でN分割せよ．
同様の処理をsplitコマンドで実現せよ．
=end

N = ARGV[0].to_i
i = 1

item = File.read('../../data/hightemp.txt').split(/\n/)

while item != []
  open("../../data/2_16/16-out-#{i}.txt",'w') do |output|
    N.times do
      break if item == []
      output.print "#{item.pop}\n"
    end
  end
  i += 1
end

# -*- coding: utf-8 -*-

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
    open("./16-out-#{i}.txt", 'w') do |output|
      output.print "#{arr.shift}\n"
    end
  end
  i += 1
end

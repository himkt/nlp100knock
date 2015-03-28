# -*- coding: utf-8 -*-

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
  p arr[arr.size-i]
  i -= 1
end

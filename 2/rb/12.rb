# -*- coding: utf-8 -*-

o1 = open('./col1.txt', 'w')
o2 = open('./col2.txt', 'w')

open('../../data/hightemp.txt', 'r') do |input|
  while line = input.gets
    item = line.split(/\t/)
    o1.print("#{item[0]}\n")
    o2.print("#{item[1]}\n")
  end
end

o1.close
o2.close

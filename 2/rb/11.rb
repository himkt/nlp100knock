# -*- coding: utf-8 -*-

open('../../data/hightemp.txt', 'r') do |input|
  while line = input.gets
    puts line.gsub(/\t/, ' ')
  end
end

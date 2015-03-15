# -*- coding: utf-8 -*-

i = 0

open('../../data/hightemp.txt') do |input|
  while line = input.gets
    i += 1
  end
end

p i

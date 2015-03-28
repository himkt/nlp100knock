# -*- coding: utf-8 -*-

N = ARGV[0].to_i

open('../../data/hightemp.txt', 'r') do |input|
  N.times do
    print input.gets
  end
end

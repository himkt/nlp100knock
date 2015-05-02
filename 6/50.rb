# -*- coding: utf-8 -*-

open('../data/nlp.txt', 'r') do |input|
  text = input.read
  text.scan(/[A-Z].*?(?:\.|\,|!|\?)\s/).each do |sentense|
    puts sentense
  end
end

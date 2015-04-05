# -*- coding: utf-8 -*-

open('../data/nlp.txt', 'r') do |input|
  text = input.read
  text.scan(/[A-Z].*?(?:\.|\,|!|\?)\s/).each do |sentense|
    puts sentense
  end
=begin
  while line = input.gets
    line.chomp!
    if line == ''
      sleep(0)
    else
      if line =~ /^[A-Z]/
        line.gsub(/e\.g\./, 'e, g,').split(/\.|;|\!|\?/).each do |item|
          p item.gsub(/e,g,/, 'e. g.')
        end
      else
        line.gsub(/e\.g\./, 'e, g,').split(/\./).each do |item|
          p item.gsub('e. g.')
        end
      end
    end
  end
=end
end

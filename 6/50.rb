# -*- coding: utf-8 -*-

open('../data/nlp.txt', 'r') do |input|
  text = input.read
  text.split(/(?:\.|\;\|\?|\!)(?:\n|\s)/).each do |sentense|
    p sentense
  end
=begin
  while line = input.gets
    line.chomp!
    if line == ''
      sleep(1)
    else
      if line =~ /^[A-Z]/
        sleep(1)
        line.split(/\./).each do |item|
          p item
          sleep(1)
        end
      else
        line.split(/\./).each do |item|
          p item
          sleep(1)
        end
      end
    end
  end
=end
end

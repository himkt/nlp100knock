# -*- coding: utf-8 -*-

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      if item =~ /Category/
        p item.match(/Category:(.*)(?:|\*)(?:\]\])/)[1]
      end
    end
  end
end

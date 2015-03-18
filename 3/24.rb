# -*- coding: utf-8 -*-

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      p item
    end
  end
end

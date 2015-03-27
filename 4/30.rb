# -*- coding: utf-8 -*-
require 'natto'

open('../data/neko.txt.mecab', 'r') do |input|
  10.times do
    line = input.gets
    next if line =~ /EOS/
    p line.chomp.split(/\t/)
  end
end

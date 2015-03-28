# -*- coding: utf-8 -*-
require 'natto'

# EOSまでで一行
open('../data/neko.txt.mecab', 'r') do |input|
  loop do
    while line = input.gets
      p line.chomp.split(/\t/)
      (sleep(1); next) if line =~ /EOS/
    end
  end
end

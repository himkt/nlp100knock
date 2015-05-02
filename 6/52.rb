# -*- conding: utf-8 -*-
require 'stemmify'

File.foreach('../data/51.nlp.txt') do |word|
  word.chomp!
  puts "#{word}\t#{word.stem}"
end

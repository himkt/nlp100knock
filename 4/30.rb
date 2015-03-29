# -*- coding: utf-8 -*-
require 'natto'

def morphize
  list = Array.new
  # EOSまでで一行
  open('../data/neko.txt.mecab', 'r') do |input|
    sentense = Array.new
    while line = input.gets
      if line =~ /EOS/
        list.push(sentense) unless sentense.empty?
        sentense = Array.new
        next 
      end
      item = line.chomp.split(/\t/)
      surface = item[0]
      block = item[1].split(',')
      sentense.push({:surface=>surface, :base=>block[6], :pos=>block[0], :pos1=>block[1]})
    end
  end
  return list
end

# list = morphize

# p list.first(3)
# p list.size

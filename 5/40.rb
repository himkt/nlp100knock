# -*- coding: utf-8 -*-
require 'natto'

class Morph
  def initialize(morph)
    @surface, block = morph.split(/\t/)
    parse(block)
  end
  def parse(block)
    block.split(/,/).each_with_index do |item, index|
      if index == 0 || index == 1 || index == 6
        @pos1 = item if index == 0
        @pos2 = item if index == 1
        @base = item if index == 6
      end
    end
  end
end


=begin
list = []
natto = Natto::MeCab.new

open('../data/neko.txt.cabocha', 'r') do |input|
  arr = []
  while line = input.gets
    line = line.chomp.gsub(/\-|D|\s|\|/, '')
    natto.parse(line).split(/\n/).each do |morph|
      next if morph =~ /^EOS|空白/
        arr.push(Morph.new(morph))
      (list.push(arr) if arr.size != 0; arr = []; next) if morph =~ /。/
    end
  end
end

p list
=end

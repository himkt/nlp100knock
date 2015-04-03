# -*- coding: utf-8 -*-
require './40'

list = []
natto = Natto::MeCab.new

catch(:foo) do
  open('../data/neko.txt.cabocha', 'r') do |input|
    arr = []
    while line = input.gets
      line = line.chomp.gsub(/\-|D|\s|\|/, '')
      natto.parse(line).split(/\n/).each do |morph|
        throw :foo if list.size == 3
        next if morph =~ /^EOS|空白/
        arr.push(Morph.new(morph))
        (list.push(arr) if arr.size != 0; arr = []; next) if morph =~ /。/
      end
    end
  end
end

p list[2]

class Chunk
  def initialize(line)
  end
  def chunking
  end
end

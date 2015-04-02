# -*- coding: utf-8 -*-
require 'natto'

class Morph
  def initialize(word)
    @natto = Natto::MeCab.new
    @word = word
    return_token(word).split(/\t|,/).each_with_index do |item, index|
      next unless index == 0 || index == 1 || index == 2 || index == 7
      @surface = item if index == 0
      @pos1 = item if index == 1
      @pos2 = item if index == 2
      @base = item if index == 7
    end #unless word =~ /^EOS/
  end
end
def return_token(word)#,arr)
  if word =~ /^EOS/
    return 'EOS'
  else
    @natto.parse(word).split(/\n/).each do |item|
      return item unless item =~ /^EOS/
    end
  end
end


list = []

open('../data/neko.txt.cabocha', 'r') do |input|
  arr = []
  while word = input.gets
    word = word.chomp.gsub(/\-|D|\s|\|/, '')
    break if list.size == 3
    (list.push(arr); arr = []) if word =~ /^EOS/
    arr.push(Morph.new(word))
  end
end

p list.pop

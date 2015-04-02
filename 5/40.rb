# -*- coding: utf-8 -*-
require 'natto'

class Morph
  def initialize(word)
    @natto = Natto::MeCab.new
    @word = word
    return_token(word).split(/\n/).each do |block|
      #p item unless item =~ /^EOS|^D|-/
      block.split(/,/).each_with_index do |item, index|
      next unless index == 0 || index == 1 || index == 2 || index == 7
      @surface = item if index == 0
      @pos1 = item if index == 1
      @pos2 = item if index == 2
      @base = item if index == 7
    end unless block =~ /^EOS|^D|-/
    end
=begin
    p ii
=end
  end
#  end

end
def return_token(word)#,arr)
  if word =~ /^EOS/
    return 'EOS'
  else
    return @natto.parse(word)#.split(/\n/).each do |item|
      #p item
      #return item unless item =~ /^EOS/
   # end
  end
end


list = []

open('../data/neko.txt.cabocha', 'r') do |input|
  arr = []
  while word = input.gets
    word = word.chomp#.gsub(/\-|D|\s|\|/, '')
    break if list.size == 3
    (list.push(arr); arr = []) if word =~ /^EOS/
    p word
    arr.push(Morph.new(word))
    p arr
  end
end

p list.pop

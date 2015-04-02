# -*- coding: utf-8 -*-
require 'natto'

class Morph
  def initialize
    @natto = Natto::MeCab.new
  end
  def return_morpheme(word)#,arr)
    item = @natto.parse(word).split(/\n/)
    item.each do |word|
      print word
      sleep(1) if word =~ /^EOS/
    end
    #@natto.parse(word).split(/\t/).each_with_index do |surface, index|
    #  p surface
    #  p index
    #end
  end
end

morph = Morph.new

open('../data/neko.txt.cabocha', 'r') do |input|
  while word = input.gets
    word = word.gsub(/\-/, '').sub(/D/, '').gsub('|', '').gsub(/\s/, '')
    morph.return_morpheme(word)
  end
end


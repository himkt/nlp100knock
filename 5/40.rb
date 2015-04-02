# -*- coding: utf-8 -*-
require 'natto'

class Morph
  def initialize(word)
    @natto = Natto::MeCab.new
    @word = word
    p return_morpheme(word) 
  end
  def return_morpheme(word)#,arr)
    if word =~ /^EOS/
      return 'EOS'
    else
      @natto.parse(word).split(/\n/).each do |item|
        return item unless item =~ /^EOS/
      end
    end
  end
end


open('../data/neko.txt.cabocha', 'r') do |input|
  while word = input.gets
    word = word.chomp.gsub(/\-|D|\s|\|/, '')
    Morph.new(word) 
  end
end


# -*- coding: utf-8 -*-
require 'natto'

=begin
形態素を表すクラスMorphを実装せよ．
このクラスは表層形（surface），基本形（base），品詞（pos），品詞細分類1（pos1）
をメンバ変数に持つこととする．
さらに，CaboChaの解析結果（neko.txt.cabocha）を読み込み，
各文をMorphオブジェクトのリストとして表現し，3文目の形態素列を表示せよ．
=end

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

if $0 == __FILE__
  p list[2]
end

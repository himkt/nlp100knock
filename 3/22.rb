# -*- coding: utf-8 -*-

=begin
記事のカテゴリ名を（行単位ではなく名前で）抽出せよ．
=end

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      if item =~ /Category/
        p item.match(/Category:(.*)(?:|\*)(?:\]\])/)[1].sub(/\|\*/,'')
      end
    end
  end
end

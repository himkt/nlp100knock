# -*- coding: utf-8 -*-

=begin
記事中でカテゴリ名を宣言している行を抽出せよ．
=end

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      if item =~ /Category/
        puts item
      end
    end
  end
end

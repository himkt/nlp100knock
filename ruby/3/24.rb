# -*- coding: utf-8 -*-

=begin
記事から参照されているメディアファイルをすべて抜き出せ．
=end

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      if match = item.match(/(File:.*?)\|/) || match = item.match(/(ファイル:.*?)\|/)
        puts match[1]
      end
    end
  end
end

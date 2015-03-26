# -*- coding: utf-8 -*-

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      if match = item.match(/(File:.*?)\|/) || match = item.match(/(ファイル:.*?)\|/)
        p match[1]
      end
    end
  end
end

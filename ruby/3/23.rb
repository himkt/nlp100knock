# -*- coding: utf-8 -*-

=begin
記事中に含まれるセクション名と
そのレベル（例えば"== セクション名 =="なら1）
を表示せよ．
=end

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      if match = item.match(/^(=+)(.*?)=+/)
        puts "#{match[2].lstrip}(level:#{match[1].size-1})"
      end
    end
  end
end

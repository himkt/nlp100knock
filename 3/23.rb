# -*- coding: utf-8 -*-

open('../data/uk.json', 'r') do |input|
  while line = input.gets
    line.split('\n').each do |item|
      if match = item.match(/^(=+)(.*?)=+/)
        puts "#{match[2].lstrip}(level:#{match[1].size-1})"
      end
    end
  end
end

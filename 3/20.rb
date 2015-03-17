# -*- coding: utf-8 -*-

open('../data/jawiki-country.json', 'r') do |input|
  while line = input.gets
    if line =~ /\"title\":\ \"イギリス\"/
      open('../data/uk.json', 'w') do |output|
        output.print(line)
      end
    end
  end
end

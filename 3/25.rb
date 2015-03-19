# -*- coding: utf-8 -*-

open('../data/uk.json', 'r') do |input|
  flag = false
  while line = input.gets
    line.split('\n').each do |item|
      (flag = true; next) if item.match(/基礎情報/)
      flag = false if item.match(/^}}/)
      if flag
        if item =~ /^\*/
          #p item
        else
          raw = item.split('=')
          #p raw[0].sub(/^\|/,'').rstrip
          p raw[1].strip.gsub(/\<.*?>/,'')
        end
      end
    end
  end
end

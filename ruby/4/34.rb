# -*- coding: utf-8 -*-
require './30'

list = morphize
list.each do |arr|
  index = 0
  while index < arr.size
    puts "#{arr[index-1][:surface]}#{arr[index][:surface]}#{arr[index+1][:surface]}" if (arr[index-1] && arr[index+1]) && (arr[index][:surface] == 'の' && arr[index-1][:pos] == '名詞' && arr[index+1][:pos] == '名詞')
    index += 1
  end
end

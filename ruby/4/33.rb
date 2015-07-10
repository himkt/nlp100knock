# -*- coding: utf-8 -*-
require './30'

list = morphize
list.each do |block|
  block.each do |item|
    puts item if item[:pos] == '名詞' && item[:pos1]  == 'サ変接続'
  end
end

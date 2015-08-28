# -*- coding: utf-8 -*-
require './30'

list = morphize
list.each do |block|
  block.each do |item|
    puts item[:surface] if item[:pos] == '動詞'
  end
end

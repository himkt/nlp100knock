# -*- coding: utf-8 -*-
require './30'

list = morphize
list.each do |arr|
  str = []
  flag = false
  arr.each do |item|
    (str.push(item[:surface]); flag = true) if item[:pos] == '名詞'
    (p str if str.size > 1; str = []; flag = false) if item[:pos] != '名詞'
  end
end

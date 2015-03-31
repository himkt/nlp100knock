# -*- coding: utf-8 -*-
require './30'

list = morphize

def tf(list)
  count = Hash.new
  list.each do |arr|
    arr.each do |item|
      count[item[:base]] = 1 unless count[item[:base]]
      count[item[:base]] += 1 if count[item[:base]]
    end
  end
  count = count.sort{|(k1, v1), (k2, v2)| v2 <=> v1}
  return count
end

# count = tf(list)

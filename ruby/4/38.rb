# -*- coding: utf-8 -*-
require './30'
require 'gnuplot'

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


df = Hash.new

tf(list).each do |k,v|
  v = v.to_s
  (df[v] = 1; next) if df[v] == nil
  df[v] += 1 if df[v]
end

key = []
value = []

df.each do |k, v|
  key.push(k)
  value.push(v)
end

Gnuplot.open do |gp|
  Gnuplot::Plot.new(gp) do |plot|
    plot.term "aqua font \"Hiragino Kaku Gothic Pro W3,14\""
    plot.title  "Histogram example"
    plot.style  "data histograms"
    plot.xtics  "nomirror rotate by -45"
    plot.data << Gnuplot::DataSet.new( [key, value] ) do |ds|
      ds.using = "2:xtic(1)"
      ds.title = ''
    end
  end

end

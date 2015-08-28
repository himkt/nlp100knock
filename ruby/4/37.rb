# -*- coding: utf-8 -*-
require 'gnuplot'
require './36'

list = morphize
count = tf(list)

data = count.first(10)


key = []
value = []

data.each do |k, v|
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

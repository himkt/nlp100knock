# -*- coding: utf-8 -*-

data = Array.new

File.foreach('../data/rt-polaritydata/rt-polaritydata/rt-polarity.neg') do |line|
  data.push("-1 #{line.chomp}")
end

File.foreach('../data/rt-polaritydata/rt-polaritydata/rt-polarity.pos') do |line|
  data.push("+1 #{line.chomp}")
end

output = open('../data/sentiment.txt','w')

data.shuffle.each do |line|
  output.print "#{line}\n"
end

output.close

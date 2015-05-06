# -*- coding: utf-8 -*-

File.foreach('../data/nlp.txt.xml') do |line|
  if item = line.match(/<word>(.*)<\/word>/)
    p item[1]
  end
end

# -*- coding: utf-8 -*-

=begin
入力文中の人名をすべて抜き出せ．
=end

=begin
54と同様.
=end

elems = Array.new
data = false

File.foreach('../data/nlp.txt.xml') do |line|
  if line =~ /<token.*>/
    data = Hash.new
  end

  if item = line.match(/<(word|lemma|POS|NER)>(.*)<\/.*>/)
    data[item[1]] = item[2]
  end
  if line =~ /<\/token>/
    elems.push(data) if data['NER'] == 'PERSON'
    data = false
  end
end

elems.each do |elem|
  line = ""
  elem.each do |item|
    line += "#{item[1]}\t"
  end
  print line.sub(/\t$/,"\n")
end

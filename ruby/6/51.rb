# -*- conding: utf-8 -*-

=begin
空白を単語の区切りとみなし，50の出力を入力として受け取り，1行1単語の形式で出力せよ．ただし，文の終端では空行を出力せよ．
=end

File.foreach('../data/50.nlp.txt') do |line|
  line.split(/\s/).each do |word|
    puts word.gsub(/\,|\.|\(|\)|\[|\]|"|'|-|\?|\!/, '')
  end
end

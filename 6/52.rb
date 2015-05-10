# -*- conding: utf-8 -*-
require 'stemmify'

=begin
51の出力を入力として受け取り，Porterのステミングアルゴリズムを適用し，単語と語幹をタブ区切り形式で出力せよ
Pythonでは，Porterのステミングアルゴリズムの実装としてstemmingモジュールを利用するとよい．
=end

File.foreach('../data/51.nlp.txt') do |word|
  word.chomp!
  puts "#{word}\t#{word.stem}"
end

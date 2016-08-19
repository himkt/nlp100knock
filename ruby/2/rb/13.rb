# -*- coding: utf-8 -*-

=begin
12で作ったcol1.txtとcol2.txtを結合し，
元のファイルの1列目と2列目をタブ区切りで並べたテキストファイルを作成せよ．
確認にはpasteコマンドを用いよ
=end

output = open('../../data/13.output.tsv', 'w')

open('../../data/col1.txt', 'r') do |input1|
  input2 = open('../../data/col2.txt', 'r')
  while line1 = input1.gets
    line2 = input2.gets
    output.print("#{line1.chomp}\t#{line2.chomp}\n")
  end
  input2.close
end

output.close

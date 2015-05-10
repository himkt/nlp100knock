# -*- coding: utf-8 -*-

=begin
文に関する極性分析の正解データを用い，以下の要領で正解データ（sentiment.txt）を作成せよ．
rt-polarity.posの各行の先頭に"+1 "という文字列を追加する（極性ラベル"+1"とスペースに続けて肯定的な文の内容が続く）
rt-polarity.negの各行の先頭に"-1 "という文字列を追加する（極性ラベル"-1"とスペースに続けて否定的な文の内容が続く）
上述1と2の内容を結合（concatenate）し，行をランダムに並び替える
sentiment.txtを作成したら，正例（肯定的な文）の数と負例（否定的な文）の数を確認せよ．
=end

=begin
方針:特になし
=end

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

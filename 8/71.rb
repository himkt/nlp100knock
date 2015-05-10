# -*- coding: utf-8 -*-

=begin
英語のストップワードのリスト（ストップリスト）を適当に作成せよ．
引数に与えられた単語（文字列）がストップリストに含まれている場合は真，それ以外は偽を返す関数を実装せよ．
その関数に対するテストを記述せよ．
=end

=begin
方針: pos neg両方に出現する単語を抽出、ストップワードとする
=end

=begin
note: 70で作成したデータに特殊文字が混入していてsplitできなかったので、
nkf -w sentiment.txt > sentiment.utf8.txtでsentiment.utf8.txtを作成し、
このデータに対して処理を行った
=end

# pos negをそれぞれ一つの文書とみなしTF値を計算する
pos = Hash.new
neg = Hash.new


File.foreach('../data/sentiment.utf8.txt') do |line|
  
  # 各行の先頭の'+1'or'-1'を取得する
  attr = line[0...2]
  
  # 本文に対して単語区切り(半角スペースで区切る)を行いeach
  line[3...line.size].chomp.split(/\s/).each do |word|
    if attr == '+1'
      pos[word] = 0 unless pos[word]
      pos[word] += 1
    else
      neg[word] = 0 unless neg[word]
      neg[word] += 1
    end
  end
end

# それぞれ20回以上出現する単語で配列を作成
pos_freq_list = pos.sort{|(k1,v1),(k2,v2)| v2 <=> v1}.delete_if{|k,v| v<20}.collect{|elem| elem[0]}
neg_freq_list = neg.sort{|(k1,v1),(k2,v2)| v2 <=> v1}.delete_if{|k,v| v<20}.collect{|elem| elem[0]}

# pos neg両方で頻出する単語は推測に使えない
stop_list = pos_freq_list&&neg_freq_list

# 入力された単語がストップワードに含まれているかどうかを判定する
def stop?(word,stop_list)
  return stop_list.include?(word)
end

tests = ['is','are','positive','you','happy','lucky','unlucky']

tests.each do |word|
  puts "#{word}:#{stop?(word,stop_list)}"
end

# -*- coding: utf-8 -*-

=begin
Stanford Core NLPの解析結果XMLを読み込み，単語，レンマ，品詞をタブ区切り形式で出力せよ
=end

=begin
方針:
1. 一行分をdataという配列に保存
2. elemにdataを保存
3. dataを初期化
4. テキストデータを読み込みきるまで1-3を繰り返す
=end

elems = Array.new
data = false

File.foreach('../data/nlp.txt.xml') do |line|
  if line =~ /<token.*>/
    data = Hash.new
  end

  if item = line.match(/<(word|lemma|POS)>(.*)<\/.*>/)
    data[item[1]] = item[2]
  end

  if line =~ /<\/token>/
    elems.push(data)
  end
end

elems.each do |elem|
  line = ""
  elem.each do |item|
    line += "#{item[1]}\t"
  end
  print line.sub(/\t$/,"\n")
end

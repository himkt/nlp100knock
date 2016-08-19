# -*- coding: utf-8 -*-

=begin
Stanford Core NLPを用い，入力テキストの解析結果をXML形式で得よ
また，このXMLファイルを読み込み，入力テキストを1行1単語の形式で出力せよ
=end

File.foreach('../data/nlp.txt.xml') do |line|
  if item = line.match(/<word>(.*)<\/word>/)
    p item[1]
  end
end

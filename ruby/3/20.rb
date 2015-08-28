# -*- coding: utf-8 -*-

=begin
Wikipedia記事のJSONファイルを読み込み，
「イギリス」に関する記事本文を表示せよ．
問題21-29では，ここで抽出した記事本文に対して実行せよ．
=end

open('../data/jawiki-country.json', 'r') do |input|
  while line = input.gets
    if line =~ /\"title\":\ \"イギリス\"/
      open('../data/uk.json', 'w') do |output|
        output.puts(line)
      end
    end
  end
end

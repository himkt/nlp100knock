# -*- coding: utf-8 -*-

=begin
与えられた文字列の各文字を，以下の仕様で変換する関数cipherを実装せよ．
1. 英小文字ならば(219 - 文字コード)の文字に置換
2. その他の文字はそのまま出力
この関数を用い，英語のメッセージを暗号化・復号化せよ．
=end

# ref: http://qiita.com/chezou/items/947900faef4c1032ed94

def chipher(str)
  chiphed = ''
  str.split(//).each do |char|
    if char.ord >= 97 && char.ord <= 122
      chiphed += (219 - char.ord).chr('UTF-8')
    else
      chiphed += char
    end
  end
  return chiphed
end

str = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
p chipher(str)

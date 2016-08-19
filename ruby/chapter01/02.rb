# -*- coding: utf-8 -*-

=begin
「パトカー」＋「タクシー」の文字を先頭から交互に連結して文字列「パタトクカシーー」を得よ．
=end

str1 = 'パトカー'
str2 = 'タクシー'

i = 0
while (c1 = str1[i]) &&  (c2 = str2[i])
  print "#{c1}#{c2}"
  i += 1
end

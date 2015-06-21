# -*- coding: utf-8 -*-

=begin
25の処理時に，
テンプレートの値から
MediaWikiの強調マークアップ（弱い強調，強調，強い強調のすべて）を除去して
テキストに変換せよ（参考: マークアップ早見表）．
=end

basic_info = Hash.new

open('../data/uk.json', 'r') do |input|
  flag = false
  key = ''
  while line = input.gets
    line.split('\n').each do |item|
      (flag = true; next) if item.match(/基礎情報/)
      flag = false if item.match(/^}}/)
      if flag
        if item =~ /^\*/
          basic_info[key] += item
        else
          raw = item.split('=')
          key = raw[0].sub(/^\|/,'').rstrip
          basic_info[key] = raw[1].strip#.gsub(/\<.*?>/,'')
        end
      end
    end
  end
end

def remove_emphasized_link(basic_info)
  basic_info_scribed = Hash.new
  basic_info.each do |k, v|
    basic_info_scribed[k] = v.gsub(/\'+/, ' ')
=begin
    # 正規表現のブロックマッチを使った解法
    if vv = v.match(/('+)(.*?)('+)/)
      basic_info_scribed[k] = vv[2]
    else
      basic_info_scribed[k] = v
    end
=end
  end
  return basic_info_scribed
end

puts remove_emphasized_link(basic_info)

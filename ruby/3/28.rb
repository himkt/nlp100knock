# -*- coding: utf-8 -*-

=begin
27の処理に加えて，
テンプレートの値からMediaWikiマークアップを可能な限り除去し，
国の基本情報を整形せよ．
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
  basic_info_removed_emphasized_link = Hash.new
  basic_info.each do |k, v|
    basic_info_removed_emphasized_link[k] = v.gsub(/\'+/, ' ')
=begin
    # 正規表現のブロックマッチを使った解法
    if vv = v.match(/('+)(.*?)('+)/)
      basic_info_scribed[k] = vv[2]
    else
      basic_info_scribed[k] = v
    end
=end
  end
  return basic_info_removed_emphasized_link
end

def remove_internal_link(basic_info_removed_emphasized_link)
  basic_info_removed_internal_link = Hash.new
  basic_info_removed_emphasized_link.each do |k, v|
    basic_info_removed_internal_link[k] = v.gsub(/\[+/, ' ').gsub(/\]+/, ' ')
  end
  return basic_info_removed_internal_link
end

def remove_other_link(basic_info_removed_internal_link)
  basic_info_removed_other_link = Hash.new
  basic_info_removed_internal_link.each do |k, v|
    basic_info_removed_other_link[k] = v.gsub(/{+/, ' ').gsub(/}+/, ' ')
  end
  return basic_info_removed_other_link
end

puts remove_other_link(remove_internal_link(remove_emphasized_link(basic_info)))

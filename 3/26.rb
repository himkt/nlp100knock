# -*- coding: utf-8 -*-

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
          basic_info[key] = raw[1].strip.gsub(/\<.*?>/,'')
        end
      end
    end
  end
end

basic_info.each do |k, v|
  puts k
  if vv = v.match(/('+)(.*?)('+)/)
    print vv[2]
  else
    print v
  end
end

# -*- coding: utf-8 -*-

=begin
60で構築したデータベースを用い，
活動場所が「Japan」となっているアーティスト数を求めよ．
=end

require './60'

puts 'make db...'
redis = make_db
puts 'done'

count = 0

puts 'saerch artists whose area is Japan'
redis.keys.each_with_index do |name,i|
  count += 1 if redis.get(name) == 'Japan'
end
puts 'done'

p count

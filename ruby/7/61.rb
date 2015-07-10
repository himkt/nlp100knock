# -*- coding: utf-8 -*_

=begin
60で構築したデータベースを用い，
特定の（指定された）アーティストの
活動場所を取得せよ.

=end

require './60'

puts 'make db...'
redis = make_db
puts 'done'
p redis.get(gets.chomp)

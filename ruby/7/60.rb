# -*- coding: utf-8 -*-

=begin
Key-Value-Store (KVS) を用い，
アーティスト名（name）から活動場所（area）
を検索するためのデータベースを構築せよ．
=end

require 'redis'
require 'json'


def make_db

  redis = Redis.new

  # artist.jsonを一行ずつ読み込む
  File.foreach('../data/artist.json.mini') do |line|
    
    # jsonを読み込む
    item = JSON.parse(line)

    # areaが存在する時
    if item['area']

      # redisに値を格納
      redis.set item['name'], item['area']
    end
  end

  return redis
end

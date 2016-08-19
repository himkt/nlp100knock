require 'countries'
require 'numo/narray'
require '../chapter09/knock87.rb'

countries = ISO3166::Country.all.map{|obj| obj.name.gsub(/\s/, '_')}
token2id, _, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))

data = countries.map {|country| token2id[country] ? Numo::Float64[mat[token2id[country]]] : nil }.select {|arr| arr}
names = countries.map {|country| token2id[country] ? country : nil}.select {|arr| arr}



data.size.times do |i|
  data.size.times do |j|
    next if i == j
    center = (data[i] + data[j]) / 2
    p center
    similarity = 1
  end
end

require 'countries'
require 'numo/narray'

countries = ISO3166::Country.all.map{|obj| obj.name.gsub(/\s/, '_')}
token2id, id2token, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))
word_matrix = Numo::Float64.zeros(mat.size, mat[0].size)
mat.each_with_index do |vector, i|
  vector.each_with_index do |x, j|
    word_matrix[i, j] = x
  end
end

countries.each do |country|
  if token2id[country]
    p country
    p word_matrix[token2id[country], true]
  end
end

require 'numo/narray'

token2id, _, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))

word_matrix = Numo::Float64.zeros(mat.size, mat[0].size)

mat.each_with_index do |vector, i|
  vector.each_with_index do |x, j|
    word_matrix[i, j] = x
  end
end


vec1 = word_matrix[token2id['United_States'], true]
vec2 = word_matrix[token2id['US'], true]

p 'United_States'
p token2id['United_States']
p vec1
p 'US'
p token2id['US']
p vec2

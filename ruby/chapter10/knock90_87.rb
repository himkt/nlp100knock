require '../chapter09/knock87.rb'
require 'numo/narray'

if __FILE__ == $0
  token2id, _, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))
  word_matrix = Numo::Float64.zeros(mat.size, mat[0].size)

  mat.each_with_index do |vector, i|
    vector.each_with_index do |x, j|
      word_matrix[i, j] = x
    end
  end

  vec1 = word_matrix[token2id['United_States'], true]
  vec2 = word_matrix[token2id['US'], true]

  p sim(vec1, vec2)
end

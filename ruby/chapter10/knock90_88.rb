require 'numo/narray'
require '../chapter09/knock87.rb'
require '../chapter09/knock88.rb'


if __FILE__ == $0
  token2id, id2token, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))
  word_matrix = Numo::Float64.zeros(mat.size, mat[0].size)
  mat.each_with_index do |vector, i|
    vector.each_with_index do |x, j|
      word_matrix[i, j] = x
    end
  end

  vec1 = word_matrix[token2id['England'], true]
  distance(word_matrix, vec1).map{|id, sim| [id2token[id], sim]}.each do |token, sim|
    puts "#{token}\t#{sim}"
  end
end

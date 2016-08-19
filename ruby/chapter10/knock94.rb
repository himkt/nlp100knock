require 'numo/narray'
require '../chapter09/knock87'


if __FILE__ == $0
  token2id, _, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))
  word_matrix = Numo::Float64.zeros(mat.size, mat[0].size)
  mat.each_with_index do |vector, i|
    vector.each_with_index do |x, j|
      word_matrix[i, j] = x
    end
  end

  results = []
  File.foreach('../../data/combined.tsv') do |line|
    word1, word2, score = line.split
    score = score.to_f

    next unless token2id[word1] && token2id[word2]
    similarity = sim(word_matrix[token2id[word1], true], word_matrix[token2id[word2], true])
    puts "#{word1}\t#{word2}\t#{similarity}\t#{score}"
    results << [word1, word2, similarity, score]
  end

  Marshal.dump(results, open('../../data/knock94.dump', 'wb'))
end

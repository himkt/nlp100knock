require 'numo/narray'
require './knock90_89.rb'


def apply(word_matrix, token2id, id2token, problems)
  results = []

  problems.each do |problem|
    next unless token2id[problem[0]] && token2id[problem[1]] && token2id[problem[2]] && token2id[problem[3]]
    vec1 = word_matrix[token2id[problem[0]], true]
    vec2 = word_matrix[token2id[problem[1]], true]
    vec3 = word_matrix[token2id[problem[2]], true]
    vec4 = word_matrix[token2id[problem[3]], true]

    most_similar_id = analogy(word_matrix, vec1, vec2, vec3)[0][0]
    vec4_ = word_matrix[most_similar_id, true]
    similarity = sim(vec4, vec4_)

    puts "#{problem[3]}\t#{id2token[most_similar_id]}\t#{similarity}"
    results << [problem[3], id2token[most_similar_id], similarity]
  end

  results
end


if __FILE__ == $0
  token2id, id2token, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))
  problems = Marshal.load(open('../../data/knock91.dump', 'rb'))
  word_matrix = Numo::Float64.zeros(mat.size, mat[0].size)
  mat.each_with_index do |vector, i|
    vector.each_with_index do |x, j|
      word_matrix[i, j] = x
    end
  end

  puts "applying start... (it takes few minitutes)"
  results = apply(word_matrix, token2id, id2token, problems)

  Marshal.dump(results, open('../../data/knock92.dump', 'wb'))
end

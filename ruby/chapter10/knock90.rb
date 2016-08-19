require 'numo/narray'

unless File.exists?('../../data/knock90')
  corpus = Marshal.load(open('../../data/knock81.dump'))
  output = open('../../data/enwiki_corpus.txt', 'w')
  corpus.each do |document|
    output.puts document
  end
  output.close

  puts 'NOTE: after running this script, please execute following command to create embedding model.'
  puts 'word2vec  -train ../../data/enwiki_corpus.txt -output ../../data/knock90'
  puts 'thanks !'

else

  token2id = Hash.new
  id2token = Hash.new
  mat = nil

  File.foreach('../../data/knock90').with_index do |line, index|
    elements = line.chomp.split

    if index == 0
      i, j = elements.map(&:to_i)
      mat = Numo::Float64.zeros(i, j)
      next
    end

    id = index - 1
    token = elements[0]
    vector = elements[1..-1].map(&:to_f)

    token2id[token] = id
    id2token[id] = token

    vector.each_with_index do |xy, d|
      mat[id, d] = xy
    end
  end

  data = [token2id, id2token, mat.to_a]
  Marshal.dump(data, open('../../data/knock90.dump', 'wb'))
end

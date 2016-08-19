require 'rblearn'
require 'stemmify'
require 'numo/narray'

def knock72
  labels = []
  features = []

  File.foreach('../../data/sentiment.txt') do |line|
    line.chomp!
    label = line[0..1]
    feature = line[3..-1]
    labels << (label == '+1' ? 1 : 0)
    features << feature
  end

  cv = Rblearn::CountVectorizer.new(lambda{|feature| feature.split.map(&:stem).map(&:downcase)}, 1, 0.9)
  cv.fit_transform(features)

  y = Numo::Int8.zeros([labels.size, 1])
  labels.each_with_index do |label, i|
    y[i, 0] = label
  end

  return [cv, y]
end


if __FILE__ == $0
  cv, y = knock72
  p [cv.doc_matrix, y]
end

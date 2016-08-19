require 'countries'
require 'numo/narray'
require '../chapter09/knock87.rb'

countries = ISO3166::Country.all.map{|obj| obj.name.gsub(/\s/, '_')}
token2id, _, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))
word_matrix = Numo::Float64.zeros(mat.size, mat[0].size)
mat.each_with_index do |vector, i|
  vector.each_with_index do |x, j|
    word_matrix[i, j] = x
  end
end


# NOTE: we can get data more simply (now, I do not use this procedure because k-means needs to be fixed)
# data = countries.map {|country| token2id[country] ? mat[token2id[country]] : nil }.select {|arr| arr}
# mat = Numo::Float64[*data]

vectors = []
labels = []
num_class = []

countries.each do |country|
  if token2id[country]
    labels << country
    vectors << word_matrix[token2id[country], true]
		num_class << 0
  end
end

# k-means
#
# parameter
k = 5

# initialize
centroids = vectors.shuffle.first(k)

10.times do |num_iter|
  puts "iter: #{num_iter}"

  # assign phase
  vectors.each_with_index do |vector, i|
    similarities = centroids.map do |centroid|
      sim(vector, centroid)
    end

    max_sim = similarities.max
    argmax = similarities.index(max_sim)
    num_class[i] = argmax
  end

  # maximization
  centroids.size.times do |t|
    new_centroid = Numo::Float64.zeros(centroids[0].shape)

    num_points = 0
    vectors.each_with_index do |vector, i|
      if num_class[i] == t
        new_centroid += vector 
        num_points += 1
      end
    end

    centroids[t] = new_centroid / num_points
  end
end

puts

centroids.size.times do |i|
  puts "cluster_#{i}"

  cluster = []
  vectors.size.times do |t|
    cluster << labels[t] if num_class[t] == i
  end

  puts cluster.sort.join(' ')
  puts
end

require 'countries'
require 'numo/narray'
require '../chapter09/knock87.rb'

countries = ISO3166::Country.all.map{|obj| obj.name.gsub(/\s/, '_')}
token2id, _, mat = Marshal.load(open('../../data/knock90.dump', 'rb'))

data = countries.map {|country| token2id[country] ? mat[token2id[country]] : nil }.select {|arr| arr}
names = countries.map {|country| token2id[country] ? country : nil}.select {|arr| arr}
mat = Numo::Float64[*data]


# TODO: random initialize should be done with normal distribution
tsne_mat = Numo::Float64.new(mat.shape[0], 2).rand

p names
p mat
p tsne_mat


# perp = 0.1
num_iter = 10
eta = 0.01
# momentum = alpha

# compute p_{i, j}
p = Numo::Float64.zeros(mat.shape[0], mat.shape[0])
q = Numo::Float64.zeros(mat.shape[0], mat.shape[0])

# I compute denominator here because denominator of p_{i, j} (appeared in Equation (3)) is constant when X are given.
omega = 1 # TODO: need to compute a variance
denominator = 0
tsne_mat.shape[0].size.times do |k|
  tsne_mat.shape[0].size.times do |l|
    next if k == l
    elem = mat[k, true] - mat[l, true]
    denominator += Math.exp(- elem.transpose.dot(elem) / omega)
  end
end


tsne_mat.shape[0].times do |i|
  tsne_mat.shape[0].times do |j|
    elem1 = mat[i, true] - mat[j, true]
    numerator = Math.exp(- elem1.transpose.dot(elem1) / omega)
    p_j_i = numerator / denominator
    elem2 = mat[j, true] - mat[j, true]
    numerator = Math.exp(- elem2.transpose.dot(elem2) / omega)
    p_i_j = numerator / denominator
    p[i, j] = p_i_j + p_j_i
  end
end


num_iter.times do |t|
  denominator = 0
  tsne_mat.shape[0].size.times do |k|
    tsne_mat.shape[0].size.times do |l|
      next if k == l
      elem = tsne_mat[k, true] - tsne_mat[l, true]
      denominator += 1 + elem.transpose.dot(elem)
    end
  end

  tsne_mat.shape[0].size.times do |i|
    tsne_mat.shape[0].size.times do |j|
      # compute low-dimensional affinities q_{i, j} using Equation 4
      elem1 = tsne_mat[i, true] - tsne_mat[j, true]
      numerator = 1 + elem1.transpose.dot(elem1)

      # NOTE: numerator^{-1} / denominator^{-1}
      q[i, j] = denominator / numerator
    end
  end

  # compute gradient (using Equation 5)
  gradient = Numo::Float64.zeros(tsne_mat.shape)
  tsne_mat.shape[0].times do |i|
    # numerator = 0
    tsne_mat.shape[0].times do |j|
      elem1 = p[i, j] - q[i, j] # scalar
      elem2 = (tsne_mat[i, true] - tsne_mat[j, true]) # vector
      elem3 = 1 / (1 + elem2.transpose.dot(elem2)) # scalar

      dcdy_i = 4 * elem1 * elem2 / elem3

      # TODO: use for loop
      gradient[i, 0] = dcdy_i[0]
      gradient[i, 1] = dcdy_i[1]
    end
  end

  # update
  tsne_mat = tsne_mat + eta * gradient
end

p tsne_mat

require 'numo/narray'
require File.dirname(__FILE__) + '/../chapter9/knock87.rb'
require File.dirname(__FILE__) + '/../chapter9/knock88.rb'


def analogy(mat, v1, v2, v3)
  result = Hash.new
  v4 = v1 - v2 + v3

  mat.shape[0].times do |i|
    v_ = mat[i, true]
    similarity = sim(v4, v_)
    result[i] = similarity
  end

  result.sort{|(_, val1), (_, val2)| val2 <=> val1}[1..10]
end

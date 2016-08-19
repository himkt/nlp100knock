require 'numo/narray'
require File.dirname(__FILE__) + '/../chapter9/knock87.rb'

def distance(mat, v1)
  result = Hash.new
  mat.shape[0].times do |i|
    v2 = mat[i, true]
    similarity = sim(v1, v2)
    result[i] = similarity
  end

  result.sort{|(_, val1), (_, val2)| val2 <=> val1}[1..10]
end

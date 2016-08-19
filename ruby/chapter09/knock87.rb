require 'numo/narray'

def sim(v1, v2)
  v1.transpose.dot(v2) / Math.sqrt(v1.transpose.dot(v1) * v2.transpose.dot(v2))
end

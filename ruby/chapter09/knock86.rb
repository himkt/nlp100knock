require 'numo/narray'

# TODO: I have not done knock85 because of the limitation of Numo::NArray and NMatrix.
#       So, this knock have not been completed yet.
mat, token2id = Marshal.load(open('../../data/knock84.dump', 'rb'))

p 'United_States'
p token2id['United_States']
p mat[token2id['United_States']]
p 'US'
p token2id['US']
p mat[token2id['US']]

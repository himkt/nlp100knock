
count_t, count_c, count_t_c, n = Marshal.load(open('../../data/knock83.dump'))
f = Hash.new
i = 0

token2id = Hash.new
id2token = Hash.new

count_t.keys.each_with_index do |token, id|
  token2id[token] = id
  id2token[id] = token
end

count_t_c.each do |t, hash|
  p i if i % 10000000 == 0
  hash.each do |c, val|
    ppmi1 = Math.log((n*val) / (count_t[t]*count_c[c]))
    f[token2id[t]] = Hash.new unless f[token2id[t]]
    f[token2id[t]][token2id[c]] = [0, ppmi1].max if val >= 10
    i += 1
  end
end

f.reject! {|key, hash| hash.size == 0}
data = [f, token2id]
Marshal.dump(data, open('../../data/knock84.dump', 'wb'))

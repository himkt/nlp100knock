
context_list = Marshal.load(open('../../data/knock82.dump', 'rb'))


# NOTE: Marshal can't dump Hash object with default proc
# count_t = Hash.new{|hash, key| hash[key] = 0}
# count_c = Hash.new{|hash, key| hash[key] = 0}
# count_t_c = Hash.new{|hash, key| hash[key] = Hash.new{|hash2, key2| hash2[key2] = 0}}

count_t = Hash.new
count_c = Hash.new
count_t_c = Hash.new
n = 0

context_list.each_with_index do |(t, c), index|
  p index if index % 10000000 == 0

  # NOTE: alternative to default proc
  count_t[t] = 0 unless count_t[t]
  count_c[c] = 0 unless count_c[c]
  count_t_c[t] = Hash.new unless count_t_c[t]
  count_t_c[t][c] = 0 unless count_t_c[t][c]

  count_t[t] += 1
  count_c[c] += 1
  count_t_c[t][c] += 1
  n += 1
end

data = [count_t, count_c, count_t_c, n]
Marshal.dump(data, open('../../data/knock83.dump', 'wb'))

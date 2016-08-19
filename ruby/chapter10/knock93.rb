
results = Marshal.load(open('../../data/knock92.dump'))
result_sims = results.map{|a, b, c| c}
puts "score: #{result_sims.select{|c| c == 1}.size.to_f / result_sims.size}"

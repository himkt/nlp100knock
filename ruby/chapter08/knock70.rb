
def knock70
	pos = File.open("../../data/rt-polaritydata/rt-polarity.pos").read
	neg = File.open("../../data/rt-polaritydata/rt-polarity.pos").read

	pos_tagged = pos.split("\n").map {|line| "+1 #{line}"}
	neg_tagged = neg.split("\n").map {|line| "-1 #{line}"}
	sen = (pos_tagged + neg_tagged).shuffle
	counter = {"+1" => 0, "-1" => 0}

	out = File.open("../../data/sentiment.txt", "w")
	sen.each do |line|
		out.puts line
	end
	out.close

	open('../../data/sentiment.txt').each_line do |line|
		counter[line[0..1]] += 1
	end

	p counter
end


if __FILE__ == $0
  knock70
end

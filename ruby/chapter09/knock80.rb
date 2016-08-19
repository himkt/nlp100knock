doc = []
pat = "[#{["\\", "\\.", "\\,", "\\!", "\\?", "\\;", "\\:", "\\(", "\\)", "\\[", "\\]", "\\'", "\""].join()}]"

# File.foreach('../../data/enwiki_small').with_index do |line, index|
# File.foreach('../../data/enwiki-20150112-400-r10-105752.txt').with_index do |line, index|
File.foreach('../../data/enwiki-20150112-400-r100-10576.txt').with_index do |line, index|
  p index if index % 50000 == 0
  sentence = line.chomp.split.map {|token|
    token.
      sub(/^#{pat}/, '').
      sub(/#{pat}$/, '').
      gsub(/#{pat}/, '') # ズル
    }.
    reject{|token| token.empty?}
  
  doc << sentence.join("\s") if sentence.size > 5
end

Marshal.dump(doc, open('../../data/knock80.dump', 'wb'))

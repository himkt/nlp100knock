require 'countries'


doc = Marshal.load(open('../../data/knock80.dump'))

original = ISO3166::Country.all.map{|country| country.name.sub(/\s\(.*?\)\s/, '')}.select{|name| name.match(/\s/)}
under_scored = original.map{|name| name.gsub(/\s/, '_')}

doc.each_with_index do |sentence, index|
  p index if index % 50000 == 0
  original.size.times do |i|
    sentence.gsub!(original[i-1], under_scored[i-1])
  end
end

Marshal.dump(doc, open('../../data/knock81.dump', 'wb'))

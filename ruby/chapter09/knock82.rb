

def window
  (Random.rand * 4.9999).to_i + 1
end

context_list = []
doc = Marshal.load(open('../../data/knock81.dump', 'rb'))

doc.each_with_index do |words, index|
  p index if index % 50000 == 0
  words = words.split(/\s|\n/)
  
  words.size.times.each do |i|
    w = window

    start_from = [0, i - w].max
    end_to = [words.size-1, i + w].min

    contexts = words[start_from...i] + words[(i+1)..end_to]
    contexts.each do |context|
      context_list << [words[i], context]
    end
  end
end

Marshal.dump(context_list, open('../../data/knock82.dump', 'wb'))

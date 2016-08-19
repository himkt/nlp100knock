
problems = []
writable = false

File.foreach('../../data/questions-words.txt').map(&:chomp).each do |line|
  if line == ": family"
    writable = true
    next
  end

  if line =~ /^\:/ && writable
    break
  end

  problems << line.split if writable
end

Marshal.dump(problems, open('../../data/knock91.dump', 'wb'))

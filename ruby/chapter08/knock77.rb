
if __FILE__ == $0

  num_all = 0

  num1 = 0.0
  num2 = 0.0
  num3 = 0.0

  # a is the actual label
  # b is the predicted label
  File.foreach('../../data/knock76.tsv') do |line|
    num_all += 1

    a, b, _ = line.split.map(&:to_f)

    if b == 1
      if a == 1
        num1 += 1
      elsif a == 0
        num2 += 1
      end
    elsif b == 0 && a == 1
      num3 += 1
    end
  end

  precision = num1 / (num1 + num2)
  recall = num3 / (num1 + num3)

  puts "precision: #{precision}"
  puts "recall: #{recall}"
  puts "F-1 score: #{2*precision*recall / (precision + recall)}"
end

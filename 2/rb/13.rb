# -*- coding: utf-8 -*-

output = open('./13.output.tsv', 'w')

open('./col1.txt', 'r') do |input1|
  input2 = open('./col2.txt', 'r')
  while line1 = input1.gets
    line2 = input2.gets
    output.print("#{line1.chomp}\t#{line2.chomp}\n")
  end
  input2.close
end

output.close

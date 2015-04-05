# -*- conding: utf-8 -*-
require 'treat'
include Treat::Core::DSL

while line = gets
  line.chomp.split(/\s/).each do |word|
    begin
      p word.gsub(/,|\.|\s|\(|\)/, '').stem
    rescue
      p word
    end
  end
end

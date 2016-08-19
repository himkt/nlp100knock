require './knock73.rb'


if __FILE__ == $0
  cv, y = knock72
  x = cv.doc_matrix

  x_train, y_train, x_test, y_test = Rblearn::CrossValidation.train_test_split(x, y, 0.7).map(&:dup)

  model = LogisticRegressionModel.new(0.1, 0.5)
  model.fit(x_train, y_train)
  
  feature_names = cv.get_feature_names
  weights = model.w.to_a.map{|arr| arr[0]}
  name_weights = {}

  feature_names.size.times do |t|
    name_weights[feature_names[t]] = weights[t]
  end

  puts "high"
  puts name_weights.sort{|(_, v1), (_, v2)| v2 <=> v1}.first(10).map{|arr| arr.join("\t")}

  puts "low"
  puts name_weights.sort{|(_, v1), (_, v2)| v1 <=> v2}.first(10).map{|arr| arr.join("\t")}
end

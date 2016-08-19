require './knock73.rb'


if __FILE__ == $0
  cv, y = knock72
  x = cv.doc_matrix

  x_train, y_train, x_test, y_test = Rblearn::CrossValidation.train_test_split(x, y, 0.7).map(&:dup)

  model = LogisticRegressionModel.new(0.1, 0.5)
  model.fit(x_train, y_train)
  
  feature_names = cv.feature_names
  weights = model.w.to_a.map{|arr| arr[0]}
  name_weights = {}

  feature_names.size.times do |t|
    name_weights[feature_names[t]] = weights[t]
  end


  a = y_test.to_a.map{|arr| arr[0]}
  b = model.predict(x_test).to_a.map{|arr| arr[0]}
  c = model.predict_prob(x_test).to_a.map{|arr| arr[0]}

  a.size.times do |t|
    puts "#{a[t]}\t#{b[t]}\t#{c[t]}"
  end
end

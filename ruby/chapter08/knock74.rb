require './knock73.rb'


if __FILE__ == $0
  cv, y = knock72
  x = cv.doc_matrix

  x_train, y_train, x_test, y_test = Rblearn::CrossValidation.train_test_split(x, y, 0.7).map(&:dup)

  model = LogisticRegressionModel.new(0.1, 0.5)
  model.fit(x_train, y_train)

  puts model.predict(x_test).to_a
end

require './knock72.rb'
require 'numo/narray'
require 'rblearn'


class LogisticRegressionModel
  attr_accessor :w

  def initialize(eta, threshold)
    @eta = eta
    @threshold = threshold
  end
  
  
  def h(x)
    z = x.dot(@w)
    return 1 / (1 + Numo::NMath.exp(-z))
  end


  def fit(x, y)
    # @w = Numo::Float64.zeros([x.shape[1], 1])
    @w = Numo::Float64.new([x.shape[1], 1]).rand
    60.times do |t|

      # p y-h(x)
      # NOTE: there is something bug
      @w = @w - @eta * x.transpose.dup.dot(h(x) - y) # x.T.dot(h(x) - y): gradient
      puts "#iter: #{t}, accuracy: #{score(x, y)} loss: #{loss(x, y)}" if t % 5 == 0
    end
  end


  def predict(x)
    probabilities = h(x)
    return probabilities > @threshold
  end


  def predict_prob(x)
    return h(x)
  end


  def score(x, y)
    predicted_class = predict(x)
    num_data = predicted_class.shape[0]

    py = predicted_class.to_a
    ry = y.to_a

    num_correct = 0
    num_data.times do |t|
      num_correct += 1 if (py[t] == ry[t])
    end

    return num_correct.to_f / num_data
  end


  def loss(x, y)
    a = - Numo::NMath.log(h(x)).transpose.dot(y)[0, 0]
    b = - Numo::NMath.log(1-h(x)).transpose.dot(1-y)
    (a + b)[0, 0]
  end
end



if __FILE__ == $0
  cv, y = knock72
  x = cv.doc_matrix
  x_train, y_train, x_test, y_test = Rblearn::CrossValidation.train_test_split(x, y, 0.3).map(&:dup)

  model = LogisticRegressionModel.new(0.01, 0.5)
  model.fit(x_train, y_train)

  puts "test accuracy: #{model.score(x_test, y_test)}"


  # require 'liblinear'
  # # train
  # model = Liblinear.train(
  #   { solver_type: Liblinear::L2R_LR },
  #   y_train.to_a.map{|a| a[0]},
  #   x_train.to_a,
  # )
  # # predict
  # puts Liblinear.predict(model, x_train.to_a.map{|a| a[0]}) # predicted class will be 1
end

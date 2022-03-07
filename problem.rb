class Problem
  def initialize(a, b)
    @addends = [a, b]
  end

  def read_problem
    "What does #{@addends.first} plus #{@addends.last} equal?"
  end

  def solution
    @addends.reduce(:+)
  end
end

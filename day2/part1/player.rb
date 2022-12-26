class Player
  attr_reader :total_score

  def initialize(name)
    @name = name
    @total_score = 0
  end

  def add_to_score(score)
    @total_score += score
  end
end

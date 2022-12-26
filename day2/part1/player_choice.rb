class PlayerChoice
  attr_reader :player, :choice_value, :choice_score

  CHOICE_SCORES = {
    "A" => 1,
    "X" => 1,
    "B" => 2,
    "Y" => 2,
    "C" => 3,
    "Z" => 3,
  }

  def initialize(player, choice_value)
    @player = player
    @choice_value = choice_value
  end

  def process!
    set_score
    assign_to_player
  end

  private

  def set_score
    @choice_score = CHOICE_SCORES[choice_value]
  end

  def assign_to_player
    player.add_to_score(choice_score)
  end
end

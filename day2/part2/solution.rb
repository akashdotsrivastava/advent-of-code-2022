require_relative './player.rb'
require_relative './player_choice.rb'
require_relative './round.rb'
require_relative './choice_decider.rb'

class Solution
  attr_reader :input, :me, :opponent

  def initialize
    @input = File.read('input.txt')
  end

  def process!
    setup_players
    play_rounds
  end

  def get_my_score
    me.total_score
  end

  private

  def setup_players
    @me = Player.new('me')
    @opponent = Player.new('opponent')
  end

  def play_rounds
    input.split("\n").each do |round_choices|
      opponent_choice_value, my_choice_decision_value  = round_choices.split(" ")

      opponent_choice = set_player_choice(opponent, opponent_choice_value)
      my_choice_value = get_my_choice_value(my_choice_decision_value, opponent_choice_value)
      my_choice = set_player_choice(me, my_choice_value)

      play_round(opponent_choice, my_choice)
    end
  end

  def get_my_choice_value(my_choice_decision_value, opponent_choice_value)
    choice_decider = ChoiceDecider.new(my_choice_decision_value, opponent_choice_value)
    choice_decider.process!
    choice_decider.my_choice_value
  end

  def set_player_choice(player, choice_value)
    player_choice = PlayerChoice.new(player, choice_value)
    player_choice.process!
    player_choice
  end

  def play_round(opponent_choice, my_choice)
    Round.new(opponent_choice, my_choice).process!
  end
end

solution = Solution.new
solution.process!
puts solution.get_my_score



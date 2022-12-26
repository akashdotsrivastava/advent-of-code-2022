class Round
  attr_reader :choice_1, :choice_2

  def initialize(choice_1, choice_2)
    @choice_1 = choice_1
    @choice_2 = choice_2
  end

  def process!
    decide_winner
  end

  ## Rock (A) > Scissors (Z)
  ## Scissors (C) > Paper (Y)
  ## Paper (B) > Rock (X)

  private

    def decide_winner
      case "#{choice_1.choice_value}#{choice_2.choice_value}"
      when "AX", "BY", "CZ"
        handle_draw
      when "AZ", "CY", "BX"
        handle_winner(choice_1)
      else
        handle_winner(choice_2)
      end
    end

    def handle_draw
      choice_1.player.add_to_score(3)
      choice_2.player.add_to_score(3)
    end

    def handle_winner(choice)
      choice.player.add_to_score(6)
    end

end

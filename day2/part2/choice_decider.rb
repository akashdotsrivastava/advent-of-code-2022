class ChoiceDecider
  attr_reader :my_choice_decision_value, :opponent_choice_value, :my_choice_value

  def initialize(my_choice_decision_value, opponent_choice_value)
    @my_choice_decision_value = my_choice_decision_value
    @opponent_choice_value = opponent_choice_value
  end

  def process!
    set_my_choice_value
  end

  ## Rock (A) > Scissors (Z)
  ## Scissors (C) > Paper (Y)
  ## Paper (B) > Rock (X)

  private

    def set_my_choice_value
      case my_choice_decision_value
      when "X"
        handle_need_to_lose
      when "Y"
        handle_need_to_draw
      else
        handle_need_to_win
      end
    end

    def handle_need_to_lose
      @my_choice_value = case opponent_choice_value
                        when "A" then "Z"
                        when "B" then "X"
                        else "Y"
                        end
    end

    def handle_need_to_draw
      @my_choice_value = case opponent_choice_value
                        when "A" then "X"
                        when "B" then "Y"
                        else "Z"
                        end
    end

    def handle_need_to_win
      @my_choice_value = case opponent_choice_value
                        when "A" then "Y"
                        when "B" then "Z"
                        else "X"
                        end
    end
end

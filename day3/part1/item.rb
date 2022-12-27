class Item
  attr_reader :value, :priority

  LOWERCASE_CHARACTERS_RANGE = ('a'..'z').freeze
  UPPERCASE_CHARACTERS_RANGE = ('A'..'Z').freeze

  def initialize(value)
    @value = value
  end

  def process!
    set_priority
  end

  private

    def set_priority
      @priority = if LOWERCASE_CHARACTERS_RANGE.include?(value)
                    value.ord - 96
                  else
                    value.ord - 38
                  end
    end
end

class Elf
  attr_reader :calorie_items

  def initialize(index, calorie_items)
    @index = index
    @calorie_items = calorie_items
  end

  def total_calories
    calorie_items.sum
  end
end

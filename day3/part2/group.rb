class Group
  attr_reader :rucksacks

  def initialize(rucksacks)
    @rucksacks = rucksacks
  end

  def get_common_item_in_rucksacks
    common_value_in_rucksacks = (rucksacks[0].item_values & rucksacks[1].item_values & rucksacks[2].item_values).first
    rucksacks[0].items.find { |item| item.value == common_value_in_rucksacks }
  end
end

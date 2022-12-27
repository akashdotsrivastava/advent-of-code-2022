require_relative './rucksack.rb'

class Solution
  attr_reader :input, :rucksacks, :total_priority

  def initialize
    @input = File.read('input.txt')
  end

  def process!
    setup_rucksacks
    set_total_priority
  end

  private

  def setup_rucksacks
    @rucksacks = []
    input.split("\n").each do |rucksack_entries|
      rucksack_item_values = rucksack_entries.split("")
      rucksack = Rucksack.new(rucksack_item_values)
      rucksack.process!
      rucksacks.push(rucksack)
    end
  end

  def set_total_priority
    @total_priority = 0
    rucksacks.each do |rucksack|
      @total_priority += rucksack.get_common_item_in_compartments.priority
    end
  end
end

solution = Solution.new
solution.process!
puts solution.total_priority



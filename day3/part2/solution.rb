require_relative './rucksack.rb'
require_relative './group.rb'

class Solution
  attr_reader :input, :rucksacks, :groups, :total_priority

  def initialize
    @input = File.read('input.txt')
  end

  def process!
    setup_rucksacks
    setup_groups
    get_total_priority_of_groups
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

  def setup_groups
    @groups = []
    rucksacks.each_slice(3).to_a.each do |rucksack_groups|
      @groups.push(Group.new(rucksack_groups))
    end
  end

  def get_total_priority_of_groups
    @total_priority = 0
    groups.each do |group|
      @total_priority += group.get_common_item_in_rucksacks.priority
    end
  end
end

solution = Solution.new
solution.process!
puts solution.total_priority



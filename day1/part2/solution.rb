require_relative './elf.rb'

class Solution
  attr_reader :input, :elves, :total_calories_carried_by_top_3_elves

  def initialize
    @input = File.read('input.txt')
    @elves = []
  end

  def process!
    assign_calories_to_elves!
    calculate_total_calories_carried_by_top_3_elves!
  end

  private

    def assign_calories_to_elves!
      input.split("\n\n").map.with_index do |elf_group, elf_index|
        calorie_items = elf_group.split("\n").map(&:to_i)
        elf = Elf.new(elf_index, calorie_items)
        elves.push(elf)
      end
    end

    def calculate_total_calories_carried_by_top_3_elves!
      @total_calories_carried_by_top_3_elves = elves.map(&:total_calories).sort.last(3).sum
    end
end

solution = Solution.new
solution.process!
puts solution.total_calories_carried_by_top_3_elves


require_relative './elf.rb'

class Solution
  attr_reader :input, :elves, :maximum_calories_carried

  def initialize
    @input = File.read('input.txt')
    @elves = []
  end

  def process!
    assign_calories_to_elves!
    calculate_maximum_calories_carried!
  end

  private

    def assign_calories_to_elves!
      input.split("\n\n").map.with_index do |elf_group, elf_index|
        calorie_items = elf_group.split("\n").map(&:to_i)
        elf = Elf.new(elf_index, calorie_items)
        elves.push(elf)
      end
    end

    def calculate_maximum_calories_carried!
      @maximum_calories_carried = elves.map(&:total_calories).max
    end
end

solution = Solution.new
solution.process!
puts solution.maximum_calories_carried


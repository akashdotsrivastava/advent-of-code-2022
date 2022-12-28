require_relative './pair.rb'

class Solution
  attr_reader :input, :pairs, :pairs_with_overlapping_ranges

  def initialize
    @input = File.read('input.txt')
  end

  def process!
    setup_pairs
    get_number_of_pairs_with_overlapping_ranges
  end

  private

  def setup_pairs
    @pairs = []
    input.split("\n").each do |pair_entries|
      pair_entries = pair_entries.split(",")
      pair = Pair.new(pair_entries)
      pair.process!
      pairs.push(pair)
    end
  end

  def get_number_of_pairs_with_overlapping_ranges
    @pairs_with_overlapping_ranges = pairs.select(&:is_one_range_inside_another?).count
  end
end

solution = Solution.new
solution.process!
puts solution.pairs_with_overlapping_ranges

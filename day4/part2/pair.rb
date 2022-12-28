require_relative './elf.rb'

class Pair
  attr_reader :pair_entries, :elf_1, :elf_2

  def initialize(pair_entries)
    @pair_entries = pair_entries
  end

  def process!
    setup_elves_in_pair
  end

  def do_ranges_overlap?
    elf_1.section_start >= elf_2.section_start && elf_1.section_start <= elf_2.section_end ||
    elf_2.section_start >= elf_1.section_start && elf_2.section_start <= elf_1.section_end
  end

  private

  def setup_elves_in_pair
    @elf_1 = Elf.new(pair_entries[0])
    elf_1.process!

    @elf_2 = Elf.new(pair_entries[1])
    elf_2.process!
  end
end

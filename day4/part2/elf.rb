class Elf
  attr_reader :section_entry, :section_start, :section_end

  def initialize(section_entry)
    @section_entry = section_entry
  end

  def process!
    @section_start, @section_end = section_entry.split("-").map(&:to_i)
  end
end

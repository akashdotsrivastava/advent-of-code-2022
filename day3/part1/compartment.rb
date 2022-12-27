class Compartment
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items.push(item)
  end

  def items_list
    items.map(&:value)
  end
end

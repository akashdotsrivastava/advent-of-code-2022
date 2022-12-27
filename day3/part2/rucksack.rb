require_relative './item.rb'

class Rucksack
  attr_reader :item_values, :items

  def initialize(item_values)
    @item_values = item_values
  end

  def process!
    create_items
  end

  private

  def create_items
    @items = []
    item_values.each do |item_value|
      item = Item.new(item_value)
      item.process!
      items.push(item)
    end
  end
end

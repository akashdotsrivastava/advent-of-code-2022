require_relative './item.rb'
require_relative './compartment.rb'

class Rucksack
  attr_reader :item_values, :items, :compartment_1, :compartment_2

  def initialize(item_values)
    @item_values = item_values
  end

  def process!
    create_items
    setup_compartments
    put_items_in_compartments
  end

  def get_common_item_in_compartments
    common_value_in_compartments = (compartment_1.items_list & compartment_2.items_list).first
    compartment_1.items.find { |item| item.value == common_value_in_compartments }
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

  def setup_compartments
    @compartment_1 = Compartment.new
    @compartment_2 = Compartment.new
  end

  def put_items_in_compartments
    items[0..items.length/2].each do |item|
      compartment_1.add_item(item)
    end
    items[items.length/2..-1].each do |item|
      compartment_2.add_item(item)
    end
  end
end

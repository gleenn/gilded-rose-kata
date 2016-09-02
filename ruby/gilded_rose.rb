require_relative 'specialized_item'
require_relative 'aged_brie'
require_relative 'backstage_pass'
require_relative 'conjured_mana_cake'
require_relative 'sulfuras'

class GildedRose

  def initialize(items)
    @items = items
  end

  NAME_TO_CLASS_MAP = Hash.new(SpecializedItem).merge({
     "Conjured Mana Cake" => ::ConjuredManaCake,
     "Aged Brie" => ::AgedBrie,
     "Sulfuras, Hand of Ragnaros" => ::Sulfuras,
     "Backstage passes to a TAFKAL80ETC concert" => ::BackstagePass,
    })

  def specialize(item)
    NAME_TO_CLASS_MAP[item.name].new(item)
  end

  def update_quality
    @items.each do |item|
      specialize(item).update_quality
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
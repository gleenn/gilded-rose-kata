require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq("foo")
    end

    def subject(item)
      GildedRose.new([item]).update_quality
      item
    end

    it "updates item's sell-in correctly" do
      expect(subject(Item.new("+5 Dexterity Vest", 10, 20)).sell_in).to eq(9)
      expect(subject(Item.new("+5 Dexterity Vest", 9, 20)).sell_in).to eq(8)
      expect(subject(Item.new("+5 Dexterity Vest", 0, 20)).sell_in).to eq(0)
      expect(subject(Item.new("+5 Dexterity Vest", -1, 20)).sell_in).to eq(0)

      expect(subject(Item.new("Sulfuras, Hand of Ragnaros", 3, 1)).sell_in).to eq(3)
      expect(subject(Item.new("Sulfuras, Hand of Ragnaros", 5000, 80)).sell_in).to eq(5000)
    end

    it "updates item's quality correctly" do
      expect(subject(Item.new("+5 Dexterity Vest", 0, 20)).quality).to eq(18)
      expect(subject(Item.new("+5 Dexterity Vest", 10, 20)).quality).to eq(19)
      expect(subject(Item.new("Elixir of the Mongoose", 5, 7)).quality).to eq(6)

      expect(subject(Item.new("Aged Brie", 2, 0)).quality).to eq(1)

      expect(subject(Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)).quality).to eq(21)
      expect(subject(Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)).quality).to eq(42)
      expect(subject(Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)).quality).to eq(50)
      expect(subject(Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)).quality).to eq(43)
      expect(subject(Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)).quality).to eq(0)

      expect(subject(Item.new("Sulfuras, Hand of Ragnaros", 5000, 80)).quality).to eq(80)
      expect(subject(Item.new("Sulfuras, Hand of Ragnaros", 0, 80)).quality).to eq(80)
      expect(subject(Item.new("Sulfuras, Hand of Ragnaros", -1, 80)).quality).to eq(80)
      expect(subject(Item.new("Sulfuras, Hand of Ragnaros", -1, 81)).quality).to eq(80)

      expect(subject(Item.new("Conjured Mana Cake", 0, 6)).quality).to eq(2)
      expect(subject(Item.new("Conjured Mana Cake", 3, 6)).quality).to eq(4)
      expect(subject(Item.new("Conjured Mana Cake", 3, 1)).quality).to eq(0)
    end
  end
end

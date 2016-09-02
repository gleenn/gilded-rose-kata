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

    it "updates items correctly" do
      expect(subject(Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)).quality).to eq(19)
      expect(subject(Item.new(name="Aged Brie", sell_in=2, quality=0)).quality).to eq(1)
      expect(subject(Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)).quality).to eq(6)
      expect(subject(Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)).quality).to eq(80)
      expect(subject(Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)).quality).to eq(80)
      expect(subject(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)).quality).to eq(21)
      expect(subject(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=40)).quality).to eq(42)
      expect(subject(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49)).quality).to eq(50)
      expect(subject(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=40)).quality).to eq(43)
      expect(subject(Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=40)).quality).to eq(0)
    end

    xit "decreases Conjured Mana Cake by 2 every day" do
      expect(subject(Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)).quality).to eq(4)
    end
  end
end

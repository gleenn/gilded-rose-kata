class SpecializedItem
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    item.quality = override_amount ? override_amount :
      bound_quality(item.quality - (decrement_quality_multiplier * decrement_quality_amount))
    update_sell_in
  end

  protected

  def override_amount
    false
  end

  def quality_upper_bound
    50
  end

  def quality_lower_bound
    0
  end

  def decrement_quality_amount
    1
  end

  def decrement_quality_multiplier
    item.sell_in == 0 ? 2 : 1
  end

  def decrement_sell_in_amount
    1
  end

  def bound_quality(value)
    [quality_lower_bound, [quality_upper_bound, value].min].max
  end

  private

  def update_sell_in
    item.sell_in = [0, item.sell_in - decrement_sell_in_amount].max
  end
end
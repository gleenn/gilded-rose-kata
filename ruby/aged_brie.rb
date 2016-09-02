class AgedBrie < SpecializedItem
  def decrement_quality_amount
    -1
  end

  def decrement_quality_multiplier
    1
  end
end
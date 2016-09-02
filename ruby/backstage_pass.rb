class BackstagePass < SpecializedItem
  <<-EOF
    Backstage passes", like aged brie, increases in quality as it's sell-in value approaches; quality increases by 2
    when there are 10 days or less and by 3 when there are 5 days or less but quality drops to 0 after the co"
  EOF

  def override_amount
    item.sell_in == 0 ? 0 : false
  end

  def decrement_quality_amount
    case item.sell_in
      when 1..5
        -3
      when 6..10
        -2
      else
        -1
    end
  end
end
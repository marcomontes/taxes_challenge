class Cart
  attr_reader :taxes, :total

  def initialize
  end

  def add_item(item, quantity)
    @taxes = item.calculate_taxes
    @total = final_price(item, quantity, @taxes)
  end

  def final_price(item, quantity, taxes)
    price_with_tax = quantity * ( item.price + taxes )
    return price_with_tax
  end

  def output_text(item, quantity)
    "#{quantity} #{item.product}: #{total.round(2)}"
  end
end

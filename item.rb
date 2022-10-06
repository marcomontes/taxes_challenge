class Item
  attr_reader :price, :product, :categories

  def initialize(string)
    words       = string.split(/ /)      # Input string as array
    @price      = words.last.to_f        # The last item is the price
    @product    = words[1..-3].join(" ") # Get the product name
    @categories = find_category
  end

  def find_category
    # Product can have multiple categories
    cats = []
    Config::CATEGORIES.each{ |i| cats << i[:category] if @product.include? i[:name] }
    return cats
  end

  def calculate_taxes
    # Check if product category are in category exceptions (Using array intersection -> &)
    tax = (categories & Config::CATEGORY_EXCEPTIONS).any? ? Config::NO_TAX : ( price * Config::BASIC_SALE_TAX )

    # Add 5% to imported products
    tax = tax + (price * Config::IMPORT_DUTY) if categories.include? 'imported'
    tax = round_value(tax)
    return tax
  end

  def round_value(n)
    rounded_price = (n * 20).round.to_f / 20.0
    ("%.02f" % rounded_price).to_f
  end
end

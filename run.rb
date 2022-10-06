require_relative 'config'
require_relative 'cart'
require_relative 'item'

filename = ARGV.first   # Read input name and use as a filename
input    = File.open("#{filename}.txt").readlines.map(&:chomp)
taxes    = total = 0.0  # Init taxes and totals in zero

c = Cart.new
input.each do |line|
  item     = Item.new(line)
  quantity = line.split(/ /).first.to_i
  c.add_item(item, quantity)
  taxes += c.taxes      # shortcut for taxes = taxes + p.taxes
  total += c.total
  puts c.output_text(item, quantity)
end

puts "Sales Taxes: #{taxes.round(2)}"
puts "Total: #{total.round(2)}"

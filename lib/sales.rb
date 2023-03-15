require 'json'
require_relative 'item'
module Sales
  # We are using Json as an input
  file = File.read('./examples/example-1.json')

  data = JSON.parse(file)

  items = []
  grand_total = 0
  taxes_total = 0

  puts "Input:"
  data['items'].each do |item|
    item = Item.new(item['quantity'], item['price'], item['category'], item['description'])
    grand_total = grand_total + item.total
    taxes_total = taxes_total + item.taxes

    # For print purposes
    items.push(item)
    puts "#{item.quantity} #{item.description} at #{item.price}"
  end

  # For print purposes
  puts ""
  puts "Output:"
  items.each do |item|
    puts "#{item.quantity} #{item.description}: #{sprintf("%0.02f", item.total)}"
  end

  puts "Sales Taxes: #{sprintf("%0.02f", taxes_total)}"
  puts "Total: #{sprintf("%0.02f", grand_total)}"
end
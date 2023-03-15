#Params definition
# quantity type Integer
# price type Float
# category type String
# description type String

class Item
  attr_accessor :quantity, :price, :category, :description, :imported, :subtotal, :taxes, :total

  EXEMPT_CATEGORIES = ['book', 'food', 'medical'].freeze

  def initialize(quantity, price, category, description)
    @quantity = quantity
    @price = price
    @category = category.downcase()
    @description = description
    @imported = description.downcase().include? "imported"
    @subtotal = calculate_subtotal
    @taxes = calculate_taxes
    @total = calculate_total
  end

  def imported?
    @imported
  end

  private
  def calculate_subtotal
    @quantity * @price
  end

  def calculate_total
    (@subtotal + @taxes).round(2)
  end

  def calculate_taxes
    taxes = 0

    # Check category to calculate %10
    unless EXEMPT_CATEGORIES.include? @category
      taxes = taxes + @subtotal * 0.1
    end

    # Check if its imported to calculate %5
    if imported?
      taxes = taxes + @subtotal * 0.05
    end

    round_to_nearest(taxes)
  end

  def round_to_nearest(taxes)
    (taxes * 20).round / 20.0
  end
end
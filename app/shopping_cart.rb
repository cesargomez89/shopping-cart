class ShoppingCart
  attr_reader :products

  def initialize(products = [])
    @products = products
  end

  def add(qty, product)
    @products << [qty, product]
  end

  def checkout
    Receipt.for(@products)
  end
end

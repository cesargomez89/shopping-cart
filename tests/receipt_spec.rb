require 'minitest/autorun'
require './app'

describe Receipt do
  describe 'empty cart' do
    before do
      @shopping_cart = ShoppingCart.new
      @receipt = Receipt.new(@shopping_cart.products)
    end

    it 'returns an empty receipt' do
      _(@receipt.process).must_equal ''
    end
  end

  describe 'input #1' do
    before do
      @product1 = Product.new(name: 'Book', price: 12.49, category: :books)
      @product2 = Product.new(name: 'music CD', price: 14.99, category: :music)
      @product3 = Product.new(name: 'chocolate bar', price: 0.85, category: :food)

      @shopping_cart = ShoppingCart.new()
      @shopping_cart.add(2, @product1)
      @shopping_cart.add(1, @product2)
      @shopping_cart.add(1, @product3)
      @receipt = Receipt.new(@shopping_cart.products)
    end

    it 'returns an empty receipt' do
      _(@receipt.process).must_equal ''

      puts @receipt.process
    end
  end
end

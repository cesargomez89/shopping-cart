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

    it 'returns the expected result' do
      _(@receipt.process).must_equal "2, Book: 24.98/n1, music CD: 16.49/n1, chocolate bar: 0.85/n1.50/n42.32"
    end
  end

  describe 'input #2' do
    before do
      @product1 = Product.new(name: 'imported box of chocolates', price: 10.00, category: :food)
      @product2 = Product.new(name: 'imported bottle of perfume', price: 47.50, category: :other)

      @shopping_cart = ShoppingCart.new()
      @shopping_cart.add(1, @product1)
      @shopping_cart.add(1, @product2)
      @receipt = Receipt.new(@shopping_cart.products)
    end

    it 'returns the expected result' do
      _(@receipt.process).must_equal ''

      puts @receipt.process
    end
  end

  describe 'input #3' do
    before do
      @product1 = Product.new(name: 'imported bottle of perfume', price: 27.99, category: :other)
      @product2 = Product.new(name: 'bottle of perfume', price: 18.99, category: :other)
      @product3 = Product.new(name: 'packet of headache pills', price: 9.75, category: :medical)
      @product4 = Product.new(name: 'imported boxes of chocolates', price: 11.25, category: :food)

      @shopping_cart = ShoppingCart.new()
      @shopping_cart.add(1, @product1)
      @shopping_cart.add(1, @product2)
      @shopping_cart.add(1, @product3)
      @shopping_cart.add(3, @product4)
      @receipt = Receipt.new(@shopping_cart.products)
    end

    it 'returns the expected result' do
      _(@receipt.process).must_equal ''

      puts @receipt.process
    end
  end
end

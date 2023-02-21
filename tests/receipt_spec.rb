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
end

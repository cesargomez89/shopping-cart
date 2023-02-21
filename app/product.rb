class Product
  attr_accessor :name, :price, :category
  EXCLUDED_PRODUCTS = %i[books food medical].freeze

  def initialize(name:, price:, category:)
    @name = name
    @price = price
    @category = category
  end

  def net_price
    @net_price ||= (@price + taxes).round(2)
  end

  def taxes
    return 0.0 if taxes_free?

    (@price * 0.1).round(2)
  end

  private

  def taxes_free?
    EXCLUDED_PRODUCTS.include? @category
  end
end

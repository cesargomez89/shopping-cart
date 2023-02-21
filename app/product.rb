# frozen_string_literal: true

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
    tax = 0.0

    return tax if taxes_free? && !imported?

    tax += 0.1 unless taxes_free?
    tax += 0.05 if imported?

    ((@price * tax) * 20).ceil / 20.0
  end

  private

  def taxes_free?
    EXCLUDED_PRODUCTS.include? @category
  end

  def imported?
    @name.match?('imported')
  end
end

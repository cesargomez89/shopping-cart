# frozen_string_literal: true

class Receipt
  def self.for(*args)
    new(*args).process
  end

  def initialize(products)
    @products = products
  end

  def process
    return '' if @products.empty?

    product_lines.concat(
      [
        format('Sales taxes: %.2f', sales_taxes),
        format('Total: %.2f', total)
      ]
    ).join('/n')
  end

  private

  def build_line(qty, product)
    format("#{qty}, #{product.name}: %.2f", (qty * product.net_price))
  end

  def product_lines
    @products.map { |qty, product| build_line(qty, product) }
  end

  def sales_taxes
    @products.sum { |qty, product| qty * product.taxes }
  end

  def total
    @products.sum { |qty, product| qty * product.net_price }
  end
end

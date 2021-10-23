class Cart < ApplicationRecord
  has_one :line_item, dependent: :delete
  belongs_to :user

  def self.cached_cart
    Rails.cache.fetch([id]) { find(id) }
  end
  # def add_product(product)
  #   item = line_items.find_by(product: product)
  #
  #   if item
  #     item.quantity += 1
  #   else
  #     item = line_items.new(product: product)
  #   end
  #
  #   item
  # end

  def total
    if line_item
    line_item.product.price
    else
      0
    end
  end

  def livraison
    if self.total > 0
      return 5
    else
      return 0
    end
  end

  def tva
    tva = self.total * 0.18
    return tva
  end

  def ttc
    ttc = self.total + self.tva + self.livraison
    return ttc
  end
end

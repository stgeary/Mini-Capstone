class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def tax
    tax = subtotal * 0.75
  end

  def total
    total = subtotal + tax
  end
end

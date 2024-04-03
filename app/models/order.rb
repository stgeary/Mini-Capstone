class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_product
  has_many :product, through: :carted_product

  def tax
    tax = subtotal * 0.75
  end

  def total
    total = subtotal + tax
  end
end

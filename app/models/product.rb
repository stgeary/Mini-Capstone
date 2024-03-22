class Product < ApplicationRecord
validates :name, presence: true
validates :price, numericality: true
validates :description, length: {minimum: 5}
validates :quantity, comparison: {greater_than: 0}

    def is_discounted
        price <= 10
    end
    def tax
        tax = price * 0.75
    end
    def total
        total = price + tax
    end
belongs_to :supplier
belongs_to :image
has_many :order
end

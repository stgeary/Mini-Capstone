class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product

    def tax
        tax = subtotal * 0.75
    end
    def total
        total = subtotal + tax
    end
end

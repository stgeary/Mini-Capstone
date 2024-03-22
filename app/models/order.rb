class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product

    def subtotal
        subtotal = price * quantity
    end
    def tax
        tax = price * 0.75
    end
    def total
        total = price + tax
    end
end

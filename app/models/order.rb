class Order < ApplicationRecord
    belongs to :user
    belongs to :product
end

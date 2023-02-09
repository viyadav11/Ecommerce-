class Item < ApplicationRecord
    has_and_belongs_to_many :orders
    validates :name,:price, presence: { message: "Please provide the value" }
    validates :rating ,numericality: { less_than: 10, message: "Rating should be in between 1-10" }
end

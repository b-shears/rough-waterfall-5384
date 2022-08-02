class Customer < ApplicationRecord
  belongs_to :supermarket
  has_many :items
  has_many :customer_items
  has_many :items, through: :customer_items
end

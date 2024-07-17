class ProductSpec < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :price_cents, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end

class Product < ApplicationRecord
  has_many :product_packages
  has_many :searches
  # validates :upc, uniqueness: true
end

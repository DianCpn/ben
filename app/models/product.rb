class Product < ApplicationRecord
  has_many :product_packages
  has_many :searches
end

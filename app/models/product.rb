class Product < ApplicationRecord


  has_many :product_packages
  has_many :searches
  has_one_attached :photo
  # validates :upc, uniqueness: true
end

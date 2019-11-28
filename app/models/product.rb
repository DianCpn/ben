class Product < ApplicationRecord
  has_many :product_packages, dependent: :destroy
  has_many :searches, dependent: :destroy
  has_one_attached :photo
  # validates :upc, uniqueness: true
end

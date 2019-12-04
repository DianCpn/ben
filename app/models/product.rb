class Product < ApplicationRecord
  has_many :product_packages, dependent: :destroy
  has_many :searches, dependent: :destroy
  has_one_attached :photo
  # validates :upc, uniqueness: true

  def color_name
    all_packagings_colors = []
    product_packages.each do |product_package|
      all_packagings_colors << product_package.packaging.color_name
    end
    unique_colors = all_packagings_colors.uniq
    if unique_colors.count == 1
      return unique_colors[0]
    else
      "neutral"
    end
  end
end

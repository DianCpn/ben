class ProductPackage < ApplicationRecord
  belongs_to :product
  belongs_to :packaging

  def color_name
    packaging.color_name
  end
end

class ProductPackage < ApplicationRecord
  belongs_to :product
  belongs_to :packaging
end

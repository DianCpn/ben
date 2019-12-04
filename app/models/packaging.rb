class Packaging < ApplicationRecord
  has_many :product_packages

  def color_name
    if category == "metal" || category == "carton" || category == "plastique"
      "jaune"
    else
      "gray"
    end
  end
end

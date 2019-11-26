class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @search = Search.new
    @product = Product.new
  end

  def create

  end

  def favorites
    @favorite = Product.where(favorite: true)
  end

  private

  def product_params
    params.require(:product).permit(:upc)
  end
end

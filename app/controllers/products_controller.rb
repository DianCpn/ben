class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.save
    @search = Search.new
    @search.user = current_user
    @search.product = @product
    @search.save
    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:upc)
  end
end

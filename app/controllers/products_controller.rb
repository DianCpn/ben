require 'httparty'
require 'json'

class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def create
    response = HTTParty.get("https://world.openfoodfacts.org/api/v0/product/#{product_params[:upc]}.json")
    @product = Product.new(product_params)
    @product.brand = response["product"]["brands_tags"][0]
    @product.title = response["product"]["product_name_fr"]
    @product.image_url = response["product"]["image_url"]
    @product.save
    @product_package = ProductPackage.new
    @product_package.product = @product
    # rattachement du packaging au produit? fait à la console en manuel ou en seed
    @product_package.save
    @search = Search.new
    @search.user = current_user
    @search.product = @product
    @search.save
    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:upc, :photo)
  end

  def url(upc)
    response = HTTParty.get('https://world.openfoodfacts.org/api/v0/product/#{upc}.json')
  end
end

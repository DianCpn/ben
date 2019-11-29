require 'httparty'
require 'json'

class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end
# dodo la sardine 3263670162219
# stir fry doudou 737628064502
# chips : 5060042640515
# pitch choco : 3256540000636

  def create
    @product = Product.new(product_params)
    @base_product = Product.find_by(upc: "#{product_params[:upc]}")
    @user = current_user
    if @base_product.present?
      @product = @base_product
      @search = Search.find_by(product_id: @product.id)
    else
      @search = Search.new
      @search.user = @user
      response = OpenfoodfactsService.new(product_params[:upc]).call
      @product.title = response["product"]["product_name"]
      @product.brand = response["product"]["brands"]
      raise
      @package = response["product"]["packaging"]
      package_array = @package.downcase.gsub(",", " ").split(" ").uniq

      package_array.map! do |item|
        if CARTON.include?(item)
          item = "carton"
        elsif GLASS.include?(item)
          item = "verre"
        elsif METAL.include?(item)
          item = "metal"
        elsif PLASTIC.include?(item)
          item = "plastique"
        else
          item = "undefined"
        end
      end

      clean_result = package_array.reject { |x| x == "undefined" }
      @product.package_array = clean_result.uniq
      @product.save
      @search.product = @product
      @search.save

      @product.package_array.each do |item|
        product_package = ProductPackage.create!(product: @product, packaging: Packaging.find_by(category: item))
      end
    end

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



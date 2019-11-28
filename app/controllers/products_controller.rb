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
    response = OpenfoodfactsService.new(3256540000636).call


    @product.title = response["product"]["product_name"]
    @product.brand = response["product"]["brands"]
    @product.save

    @package = response["product"]["packaging"]
    package_array = @package.downcase.gsub(" ", "").split(",")

    hash_sort = {
      carton: ["carton"],
      glass: ["verre", "glass", "bocal"],
      plastic: ["plastique", "plastic"],
      metal: ["aluminum"]
    }

    result_carton = package_array.map do |item|
      hash_sort[:carton].include?(item)
    end

    result_glass = package_array.map do |item|
      hash_sort[:glass].include?(item)
    end

    result_plastic = package_array.map do |item|
      hash_sort[:plastic].include?(item)
    end

    result_metal = package_array.map do |item|
      hash_sort[:metal].include?(item)
    end



    @product_package = ProductPackage.new
    @product_package.product = @product
    result_glass.include?(true)


































    # response = HTTParty.get("https://world.openfoodfacts.org/api/v0/product/#{product_params[:upc]}.json")
    # @product = Product.new(product_params)
    # @products = Product.all

    #  @products.each do |product|
    #  product.upc == @product.upc
    # end
    #   redirect_to product_path(@product)
    # else
    #   if response["product"].nil?
    #     @product.brand = "TBD"
    #   else
    #     @product.brand = response["product"]["brands_tags"][0]
    #   end
    #   if response["product"].nil?
    #     @product.title = "TBD"
    #   else
    #     @product.title = response["product"]["product_name_fr"]
    #   end
    #   if response["product"].nil?
    #     @product.image_url = "TBD"
    #   else
    #     @product.image_url = response["product"]["image_url"]
    #   end
    #   @product.save
    # end
    # @product_package = ProductPackage.new
    # @product_package.product = @product
    # # rattachement du packaging au produit? fait à la console en manuel ou en seed
    # @product_package.save
    # @search = Search.new
    # @search.user = current_user
    # @search.product = @product
    # @search.save
    # redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:upc, :photo)
  end

  def url(upc)
    response = HTTParty.get('https://world.openfoodfacts.org/api/v0/product/#{upc}.json')
  end
end

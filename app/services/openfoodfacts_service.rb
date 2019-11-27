require 'httparty'
require 'json'

# class OpenfoodfactsService
class OpenfoodfactsService
  def initialize(upc)
    @upc = upc
  end

  def call
    response = HTTParty.get("https://world.openfoodfacts.org/api/v0/product/#{@upc}.json")
  end
end

# faire a la main ou seeder le type de packaging
test_upc = 5410041010800
puts OpenfoodfactsService.new(test_upc).call

# product.title = response["product"]["product_name_fr"]
# product.brand = response["product"]["brands"]
# product.image_url = response["product"]["image_url"]
# puts "#{product.title}, #{product.brand}, #{product.image_url}"

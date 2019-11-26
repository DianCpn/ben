require 'httparty'
require 'json'

response = HTTParty.get('https://world.openfoodfacts.org/api/v0/product/5410041010800.json')

puts title = response["product"]["product_name_fr"]
puts brand = response["product"]["brands_tags"][0]
puts upc = response['code']
puts image_url = response["product"]["image_url"]
# puts packaging = response["product"]["packaging"]
# faire a la main ou seeder le type de packaging

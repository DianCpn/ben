# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Seed: Deleting existing records...'

# Instances to be added later

Product.delete_all
Search.delete_all
# User.delete_all
Product_packages.delete_all

# Add photo.purge to destroy photos in cloudinary ?

file = URI.open('https://meme.eq8.eu/noidea.jpg')
article = Article.new(title: 'NES', body: "A great console")
article.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
# Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb

# -------------------------------------

file1 = URI.open('https://res.cloudinary.com/dq24zunln/image/upload/v1574424583/shallow-focus-photography-of-brown-llama-1300358_qmjqy5.jpg')
product1 = Product.new(
  brand: "",
  title: "",
  upc: ,
  address: "16 villa gaudelet, Paris",
  favorite: false,
  created_at: "2019-11-17 [11:22:33]",
  updated_at: "2019-11-18 [11:45:33]",
  packaging_id: ,
  product_id: ,
)
lama1.photo.attach(io: file1, filename: 'shallow-focus-photography-of-brown-llama-1300358_qmjqy5.jpg', content_type: 'image/jpg')
lama1.save
puts 'Product1 created!'



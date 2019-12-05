# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Seed: Deleting existing records...'

# Instances to be added later

ProductPackage.destroy_all
Packaging.destroy_all
Product.destroy_all
Search.destroy_all
User.destroy_all
Container.destroy_all

# Add photo.purge to destroy photos in cloudinary ?

# file = URI.open('https://meme.eq8.eu/noidea.jpg')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
# Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb

# -------------------------------------
puts "seeding packaging ..."
carton = Packaging.create(category: "carton", instruction: "À recycler dans la poubelle JAUNE", tip: "Les barquettes en carton se recyclent et se trient même souillées.")
plastique = Packaging.create(category: "plastique", instruction: "À recycler dans la poubelle JAUNE", tip: "Les bouteilles en plastique doivent être aplaties dans leur longueur")
metal = Packaging.create(category: "métal", instruction: "À recycler dans la poubelle JAUNE", tip: "Avec 9 boîtes de conserve recyclées, on fabrique 1 boule de pétanque")
verre = Packaging.create(category: "verre", instruction: "À recycler dans la poubelle BLANCHE", tip: "Tous les pots et bocaux en verre se recyclent et se trient bien vidés sans leur couvercle.")
puts "packaging seeded!"

puts "seeding products ..."


milka_chocolat_au_lait = Product.new(
  brand: "Milka",
  title: "Chocolat au lait",
  upc: "7622210719881",
  package_array: ["plastique"]
)
# milka_chocolat_au_lait_file = URI.open('https://static.openfoodfacts.org/images/products/762/221/071/9881/front_fr.4.200.jpg')
# milka_chocolat_au_lait.photo.attach(io: milka_chocolat_au_lait_file, filename: 'front_fr.4.200.jpg', content_type: 'image/jpg')
milka_chocolat_au_lait.save
puts 'milka_chocolat_au_lait created!'


connetable_sardine_nature = Product.new(
  brand: "Connetable",
  title: "Sardine nature",
  upc: "3263670162219",
  package_array: ["metal"]
)
# connetable_sardine_nature = URI.open('https://static.openfoodfacts.org/images/products/326/367/016/2219/front_fr.31.100.jpg')
# connetable_sardine_nature.photo.attach(io: connetable_sardine_nature, filename: 'front_fr.31.100.jpg', content_type: 'image/jpg')
connetable_sardine_nature.save
puts 'connetable_sardine-nature created!'



iris_pasta_di_semola = Product.new(
  brand: "Iris",
  title: "Pasta di semola",
  upc: "8015197024120",
  package_array: ["plastique"]
)
# iris_pasta_di_semola = URI.open('https://static.openfoodfacts.org/images/products/801/519/702/4120/front_fr.3.200.jpg')
# iris_pasta_di_semola.photo.attach(io: iris_pasta_di_semola, filename: 'front_fr.3.200.jpg', content_type: 'image/jpg')
iris_pasta_di_semola.save
puts 'iris_pasta_di_semola created!'


markal_flocons_de_cereales = Product.new(
  brand: "Markal",
  title: "Flocons De Cereales",
  upc: "3329483701202",
  package_array: ["plastique"]
)
# markal_flocons_de_cereales = URI.open('https://static.openfoodfacts.org/images/products/801/519/702/4120/front_fr.3.200.jpg')
# markal_flocons_de_cereales.photo.attach(io: markal_flocons_de_cereales, filename: 'front_fr.3.200.jpg', content_type: 'image/jpg')
markal_flocons_de_cereales.save
puts 'markal_flocons_de_cereales created!'


krema_mini_cub_bio = Product.new(
  brand: "Krema",
  title: "Mini cub bio",
  upc: "3664346311601",
  package_array: ["plastique"]
)
# krema_mini_cub_bio = URI.open('https://static.openfoodfacts.org/images/products/366/434/631/1601/front_fr.31.100.jpg')
# krema_mini_cub_bio.photo.attach(io: krema_mini_cub_bio, filename: 'front_fr.31.100.jpg', content_type: 'image/jpg')
krema_mini_cub_bio.save
puts 'krema_mini_cub_bio created!'


tyrrells_chips_de_betterave = Product.new(
  brand: "Tyrrells",
  title: "Chips de betterave,  panais et carotte au sel de mer",
  upc: "5060042640515",
  package_array: ["plastique"]
)
# tyrrells_chips_de_betterave = URI.open('https://static.openfoodfacts.org/images/products/506/004/264/0515/front_fr.45.400.jpg')
# tyrrells_chips_de_betterave.photo.attach(io: tyrrells_chips_de_betterave, filename: 'front_fr.45.400.jpg', content_type: 'image/jpg')
tyrrells_chips_de_betterave.save
puts 'tyrrells_chips_de_betterave created!'



dacco_bello_formule_peps = Product.new(
  brand: "Dacco bello",
  title: "Formule pep’s",
  upc: "3270720001541",
  package_array: ["plastique"]
)
# dacco_bello_formule_peps = URI.open('')
# dacco_bello_formule_peps.photo.attach(io: dacco_bello_formule_peps, filename: '', content_type: 'image/jpg')
dacco_bello_formule_peps.save
puts 'dacco_bello_formule_peps created!'


evian = Product.new(
  brand: "Evian",
  title: "Evian 1.5L",
  upc: "3068320120256",
  package_array: ["plastique"]
)
evian.save
puts 'evian created!'


brioche_pasquier_pitch_gout_chocolat = Product.new(
  brand: "Brioche Pasquier",
  title: "Pitch gout Chocolat",
  upc: "3256540000636",
  package_array: ["carton"]
)
brioche_pasquier_pitch_gout_chocolat.save
puts 'brioche_pasquier_pitch_gout_chocolat created!'


la_baleine_sel_fin = Product.new(
  brand: "La baleine",
  title: "Sel Fin ",
  upc: "3183280017337",
  package_array: ["plastique"]
)
la_baleine_sel_fin.save
puts 'la_baleine_sel_fin created!'


daddy_sucre_en_poudre = Product.new(
  brand: "Daddy",
  title: "Sucre en poudre, Distributeur de Bûchettes de Sucre",
  upc: "3165431690002",
  package_array: ["carton"]
)
daddy_sucre_en_poudre.save
puts 'daddy_sucre_en_poudre created!'


casino_miel_de_fleurs_cremeux = Product.new(
  brand: "Casino",
  title: "Miel de fleurs cremeux",
  upc: "3222472194446",
  package_array: ["plastique"]
)
casino_miel_de_fleurs_cremeux.save
puts 'casino_miel_de_fleurs_cremeux created!'


casino_sirop_de_peche = Product.new(
  brand: "Casino",
  title: "Sirop de Peche",
  upc: "3222471448915",
  package_array: ["metal"]
)
casino_sirop_de_peche.save
puts 'casino_sirop_de_peche created!'


tetley_the_noir_anglais = Product.new(
  brand: "Tetley",
  title: "Thé noir anglais",
  upc: "3222471448915",
  package_array: ["carton"]
)
tetley_the_noir_anglais.save
puts 'tetley_the_noir_anglais created!'



knorr_soupe_bio_potiron_carottes = Product.new(
  brand: "Knorr",
  title: "Soupe bio potiron carottes",
  upc: "8714100742860",
  package_array: ["carton"]
)
knorr_soupe_bio_potiron_carottes.save
puts 'knorr_soupe_bio_potiron_carottes created!'



maille_velours_de_vinaigre_balsamique = Product.new(
  brand: "Maille",
  title: "Velours de vinaigre Balsamique",
  upc: "8722700197508",
  package_array: ["verre"]
)
maille_velours_de_vinaigre_balsamique.save
puts 'maille_velours_de_vinaigre_balsamique created!'


maille_moutarde_a_lancienne = Product.new(
  brand: "Maille",
  title: "Moutarde à l'ancienne",
  upc: "3036810207800",
  package_array: ["verre", "metal"]
)
maille_moutarde_a_lancienne.save
puts 'maille_moutarde_a_lancienne created!'

tablette_chocolat_noir = Product.new(
  brand: "Villars",
  title: "Chocolat noir",
  upc: "7610036012507",
  package_array: ["metal", "carton"]
)
tablette_chocolat_noir.save
puts 'tablette_chocolat_noir created!'
puts 'products seeded!'

puts "seeding product packages .."
ProductPackage.create(product: milka_chocolat_au_lait, packaging: plastique)
ProductPackage.create(product: connetable_sardine_nature, packaging: metal)
ProductPackage.create(product: iris_pasta_di_semola, packaging: plastique)
ProductPackage.create(product: iris_pasta_di_semola, packaging: carton)
ProductPackage.create(product: markal_flocons_de_cereales, packaging: plastique)
ProductPackage.create(product: krema_mini_cub_bio, packaging: plastique)
ProductPackage.create(product: tyrrells_chips_de_betterave, packaging: plastique)
ProductPackage.create(product: dacco_bello_formule_peps, packaging: plastique)
ProductPackage.create(product: evian, packaging: plastique)
ProductPackage.create(product: brioche_pasquier_pitch_gout_chocolat, packaging: plastique)
ProductPackage.create(product: la_baleine_sel_fin, packaging: carton)
ProductPackage.create(product: la_baleine_sel_fin, packaging: plastique)
ProductPackage.create(product: daddy_sucre_en_poudre, packaging: carton)
ProductPackage.create(product: casino_miel_de_fleurs_cremeux, packaging: plastique)
ProductPackage.create(product: casino_sirop_de_peche, packaging: metal)
ProductPackage.create(product: tetley_the_noir_anglais, packaging: carton)
ProductPackage.create(product: knorr_soupe_bio_potiron_carottes, packaging: carton)
ProductPackage.create(product: maille_velours_de_vinaigre_balsamique, packaging: verre)
ProductPackage.create(product: maille_velours_de_vinaigre_balsamique, packaging: metal)
ProductPackage.create(product: maille_moutarde_a_lancienne, packaging: verre)
ProductPackage.create(product: maille_moutarde_a_lancienne, packaging: metal)
ProductPackage.create(product: tablette_chocolat_noir, packaging: metal)
ProductPackage.create(product: tablette_chocolat_noir, packaging: carton)
puts "product packages done!"


puts "creating verre containers"

#filepath = './db/containers.json'
filepath = File.join(Rails.root, 'db', 'containers.json')

serialized_containers = File.read(filepath)

containers = JSON.parse(serialized_containers)


containers["features"].each do |container|
  Container.create(name: "Conteneur de verre", address: "#{container["attributes"]["Match_addr"]}", sector: "#{container["attributes"]["secteur"]}", latitude: "#{container["geometry"]["y"]}", longitude:"#{container["geometry"]["x"]}", material: "verre")
end

puts "creating pile containers"

filepath = File.join(Rails.root, 'db', 'supermarkets.json')

serialized_containers = File.read(filepath)

containers = JSON.parse(serialized_containers)


containers["features"].each do |container|
  Container.create(name: "#{container["attributes"]["Name"]}", address: "#{container["attributes"]["Match_addr"]}", sector: "#{container["attributes"]["secteur"]}", latitude: "#{container["geometry"]["y"]}", longitude:"#{container["geometry"]["x"]}", hours:"#{container["attributes"]["horaires"]}", material: "pile")
end

puts "done containers!"


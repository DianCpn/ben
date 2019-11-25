class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :title
      t.string :upc
      t.string :image_url

      t.timestamps
    end
  end
end

class CreateProductPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_packages do |t|
      t.references :product, foreign_key: true
      t.references :packaging, foreign_key: true

      t.timestamps
    end
  end
end

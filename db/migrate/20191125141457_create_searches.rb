class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.boolean :favorite

      t.timestamps
    end
  end
end

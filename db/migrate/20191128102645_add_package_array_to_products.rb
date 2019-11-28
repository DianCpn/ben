class AddPackageArrayToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :package_array, :string, array: true, default: []
  end
end

class AddAddressToContainers < ActiveRecord::Migration[5.2]
  def change
    add_column :containers, :address, :string
  end
end

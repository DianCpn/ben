class AddNameToContainers < ActiveRecord::Migration[5.2]
  def change
    add_column :containers, :name, :string
  end
end

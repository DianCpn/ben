class AddTypeToContainers < ActiveRecord::Migration[5.2]
  def change
    add_column :containers, :type, :string
  end
end

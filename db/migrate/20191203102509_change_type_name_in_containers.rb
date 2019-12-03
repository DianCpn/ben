class ChangeTypeNameInContainers < ActiveRecord::Migration[5.2]
  def change
    rename_column :containers, :type, :material
  end
end

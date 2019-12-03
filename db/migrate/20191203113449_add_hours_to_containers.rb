class AddHoursToContainers < ActiveRecord::Migration[5.2]
  def change
    add_column :containers, :hours, :string
  end
end

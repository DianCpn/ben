class AddCoordinatesToContainers < ActiveRecord::Migration[5.2]
  def change
    add_column :containers, :latitude, :float
    add_column :containers, :longitude, :float
  end
end

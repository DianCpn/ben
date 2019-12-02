class AddTipToPackagings < ActiveRecord::Migration[5.2]
  def change
    add_column :packagins, :tip, :string
  end
end

class AddTipToPackagings < ActiveRecord::Migration[5.2]
  def change
    add_column :packagings, :tip, :string
  end
end

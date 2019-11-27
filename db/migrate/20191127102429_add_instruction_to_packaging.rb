class AddInstructionToPackaging < ActiveRecord::Migration[5.2]
  def change
    add_column :packagings, :instruction, :string
    add_column :packagings, :icon, :string
  end
end

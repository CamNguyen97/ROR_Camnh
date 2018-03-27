class RemoveConfirmationFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :confirmation, :string
  end
end

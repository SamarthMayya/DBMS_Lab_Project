class AddUserToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :user_id, :string
  end
end

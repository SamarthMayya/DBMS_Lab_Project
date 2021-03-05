class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :account_id
      t.integer :cos_id
      t.string :account_type
      t.integer :account_no
      t.integer :balance

      t.timestamps
    end
  end
end

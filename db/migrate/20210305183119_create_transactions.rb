class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :transaction_amount
      t.string :description

      t.timestamps
    end
    add_index :transactions, :sender_id
    add_index :transactions, :receiver_id 
  end
end

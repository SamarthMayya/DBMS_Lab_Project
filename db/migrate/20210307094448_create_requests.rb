class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :requester_id
      t.integer :sender_id
      t.integer :amount
      t.string :message
      t.string :status
      t.integer :sender_phno

      t.timestamps
    end
  end
end

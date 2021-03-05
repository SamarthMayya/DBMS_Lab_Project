class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :mother_name
      t.string :father_name
      t.date :dob
      t.integer :aadhar_no
      t.string :pan_no
      t.string :photo
      t.string :sign
      t.integer :cos_id
      t.integer :phno
      t.string :adress
      t.string :nationality

      t.timestamps
    end
  end
end

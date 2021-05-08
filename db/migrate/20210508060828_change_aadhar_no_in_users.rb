class ChangeAadharNoInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :aadhar_no, :string 
  end
end

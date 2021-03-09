class Requests < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :requester_id
  end
end

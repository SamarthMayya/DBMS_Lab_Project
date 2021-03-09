class MakeRequesterFk < ActiveRecord::Migration[5.1]
  def change
    add_reference :requests, :requester, foreign_key: { to_table: :users }
  end
end

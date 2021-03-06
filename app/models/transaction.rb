class Transaction < ApplicationRecord
  belongs_to :receiver, foreign_key: :receiver_id, class_name: "User"
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  def create_transaction(sender_acc_no, receiver_acc_no)
    sender_acc = Account.find_by(account_no: sender_acc_no)
    receiver_acc = Account.find_by(account_no: receiver_acc_no)
    sender_acc.balance -= transaction_amount

    receiver_acc.balance += transaction_amount
    sender_acc.save
    receiver_acc.save
  end
end

class Transaction < ApplicationRecord
  validate :receiver_id_is_valid_acc_no 
  belongs_to :sender, foreign_key: :sender_id, class_name: "User" 

  def get(user_id)
    return Transaction.where(sender_id: user_id).or(receiver_id: Account.find_by(user_id: user_id).account_no)  
  end
  def receiver_id_is_valid_acc_no 
    if Account.where(account_no: receiver_id).exists? == false 
      errors.add(:receiver_account_number, "should be a valid account number") 
    end 
  end 

  def create_transaction
    sender_acc = Account.find_by(user_id: sender_id)  
    receiver_acc = Account.find_by(account_no: receiver_id)
    sender_acc.balance -= transaction_amount
    receiver_acc.balance += transaction_amount
    sender_acc.save
    receiver_acc.save
  end
end

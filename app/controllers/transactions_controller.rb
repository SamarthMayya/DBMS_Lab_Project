class TransactionsController < ApplicationController 
  before_action :check_login
  before_action :set_transaction, only: %i[ show ] 

  def index
    @transactions = Transaction.get(current_user.id)  
  end

  def new
    @transaction = Transaction.new 
  end

  def show  
  end 

  def create
    @transaction = Transaction.new(tranaction_params)    
    if current_user.account.balance >= transaction_params[:transaction_amount]) 
      @transaction.create_transaction 
      if @transaction.save 
        redirect_to @transaction, notice: "Transaction completed successfully" 
      else 
        render 'new', notice: "Transaction failed!" 
      end 
    else 
      render 'new', notice: "Not enough balance to make transaction" 
    end 
  end 

  private 

  def transaction_params 
    params.require(:transaction).permit(:sender_id, :receiver_id, :transaction_amount)  
  end 

  def set_transaction 
    @transaction = Transaction.find(params[:id])  
  end 

  def check_login 
    if current_user.nil? 
      redirect_to login_url, notice: "You must be logged in to make a transaction" 
    end 
  end 
end

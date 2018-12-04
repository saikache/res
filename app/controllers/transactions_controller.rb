class TransactionsController < ApplicationController

  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = current_user.transactions.build  
  end
  
  def create
    @transaction = current_user.transactions.build(transaction_params.slice("amount", "t_type"))

    respond_to do |format|
      if @transaction.valid? && @transaction.process_transactoin(get_pin)
        format.html { redirect_to transactions_path, notice: 'Transaction done successfully' }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end


  def deposit
    
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :t_type, :card, :pin)
  end

  def get_pin
    pin_hash = transaction_params.slice("pin").to_h
    pin_hash["pin"]
  end

end

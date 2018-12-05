require 'spec_helper'
require 'rails_helper'

describe Transaction do
  describe '#transaction' do
    it 'Transaction type should be in [\'Deposit\', \'Withdraw\']' do
    	user_params = {
    									email: 's@s.com',
    									password: 'password',
    									amount: 10,
    									card: '1111',
    									pin: '1111',
    									confirmed_at: Time.now,
    									is_active: true
    								}
    	user = User.create(user_params)
    	transaction = user.transactions.build(amount: 0)
      transaction.t_type = '' # invalid transaction type
      transaction.valid? # run validations
      expect(transaction.errors[:t_type]).to include("Transaction type Must be Deposit or Withdraw") # check for presence of error
    end
  end


  describe '#transaction' do
    it 'funds should be available to Withdraw' do
    	user_params = {
    									email: 's@s.com',
    									password: 'password',
    									amount: 10,
    									card: '1111',
    									pin: '1111',
    									confirmed_at: Time.now,
    									is_active: true
    								}
    	user = User.create(user_params)
    	transaction = user.transactions.build(amount: 100)
      transaction.t_type = 'Withdraw' # invalid transaction type
      transaction.valid?
      expect(transaction.errors[:you]).to include("don't have sufficient amount")
    end
  end


end

class Transaction < ApplicationRecord
  TRANSACTION_TYPE = ['Deposit', 'Withdraw']

  belongs_to :user

  validates :t_type, inclusion: { in: TRANSACTION_TYPE, message: "Transaction type Must be #{TRANSACTION_TYPE.join(' or ')}" }  # transaction type
  validate :check_funds
  after_create :update_funds

  def pin
  end

  def process_transactoin(pin)
    if is_deposit?
      save
    elsif is_withdraw?
      if user.pin == pin
        save
      else
        errors.add(:enterd, "PIN is not valid!")
        false
      end
    end
  end

  def is_deposit?
    t_type == 'Deposit'
  end

  def is_withdraw?
    t_type == 'Withdraw'
  end

  private

  def update_funds
    user.update(amount: user.amount + amount) if is_deposit?
    user.update(amount: user.amount - amount) if is_withdraw?
  end

  def check_funds
    return if is_deposit?
    errors.add(:you, 'don\'t have sufficient amount') unless user.amount >= amount
  end
end

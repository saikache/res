class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :t_type
      t.references :user, foreign_key: true
      t.float :amount, default: 0
      t.string :transaction_made_by

      t.timestamps
    end
  end
end

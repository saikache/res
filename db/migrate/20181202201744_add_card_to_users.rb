class AddCardToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :card, :string
    add_column :users, :pin, :string
  end
end

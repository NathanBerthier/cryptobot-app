class ChangeTableTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :buy_price
    remove_column :transactions, :sell_price
    remove_column :transactions, :buy_at
    remove_column :transactions, :sell_at
    add_column :transactions, :price, :integer
    add_column :transactions, :time, :datetime
    add_column :transactions, :transaction_type, :string
  end
end

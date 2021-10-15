class ChangeTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :buy_price, :integer
    remove_column :transactions, :sell_price, :integer
    remove_column :transactions, :buy_at, :datetime
    remove_column :transactions, :sell_at, :datetime
    add_column :transactions, :price, :integer
    add_column :transactions, :time, :datetime
    add_column :transactions, :transaction_type, :string
  end
end

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :buy_price
      t.datetime :buy_at
      t.integer :sell_price
      t.datetime :sell_at
      t.integer :balance_value
      t.timestamps
    end
  end
end

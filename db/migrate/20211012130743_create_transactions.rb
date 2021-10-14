class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :price
      t.datetime :time
      t.integer :balance_value
      t.string :transaction_type
      t.timestamps
    end
  end
end

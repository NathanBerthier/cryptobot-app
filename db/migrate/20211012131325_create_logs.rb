class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :type
      t.integer :crypto_balance
      t.integer :crypto_value
      t.integer :dai_balance
      t.integer :dai_value
      t.string :market_direction
      t.timestamps
    end
  end
end

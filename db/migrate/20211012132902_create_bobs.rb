class CreateBobs < ActiveRecord::Migration[6.0]
  def change
    create_table :bobs do |t|
      t.string :status
      t.timestamps
    end
  end
end

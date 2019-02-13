class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.text :detail
      t.integer :price, default: 0

      t.timestamps
    end
  end
end

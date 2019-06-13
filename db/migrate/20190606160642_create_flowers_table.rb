class CreateFlowersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :flower
      t.integer :quantity
      t.integer :bouquet_id
      t.integer :customer_id
    end
  end
end

class CreateFlowersTable < ActiveRecord::Migration
  def change
    create_table :flowers do |t|
      t.string :flower 
      t.string :bouqet
      t.integer :customer_id
    end
  end
end

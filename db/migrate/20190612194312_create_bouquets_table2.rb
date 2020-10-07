class CreateBouquetsTable2 < ActiveRecord::Migration[5.2]
  def change
    create_table :bouquets do |t|
      t.string :name
      t.string :occassion
      t.string :accessories
      t.string :flower_name
      t.integer :flower_quantity
      t.integer :customer_id
    end
  end
end

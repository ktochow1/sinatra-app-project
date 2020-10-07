class DropBouquetsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :bouquets
  end
end

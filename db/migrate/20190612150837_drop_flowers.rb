class DropFlowers < ActiveRecord::Migration[5.2]
  def change
    drop_table :flowers
  end
end

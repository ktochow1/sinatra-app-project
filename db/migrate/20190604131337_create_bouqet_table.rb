class CreateBouqetTable < ActiveRecord::Migration
  def change
    create_table :bouqets do |t|
      t.string :occasion
      t.integer :customer_id
    end
  end
end

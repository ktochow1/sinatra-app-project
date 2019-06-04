class CreateCustomersTable < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :username
      t.string :password_digest
    end
  end
end

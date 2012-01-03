class CreateBillsTable < ActiveRecord::Migration
  def up
    create_table :bills do |t|
      t.string :name
      t.text :description
      t.float :amount
      t.integer :user_id
      
      t.timestamps
    end
  end

  def down
    drop_table :bills
  end
end

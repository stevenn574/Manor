class CreatePaymentsTable < ActiveRecord::Migration
  def up
    create_table :payments do |t|
      t.integer :user_id
      t.boolean :paid
      
      t.timestamps
    end
  end

  def down
    drop_table :payments
  end
end

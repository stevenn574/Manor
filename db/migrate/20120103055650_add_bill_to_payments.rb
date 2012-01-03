class AddBillToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :bill_id, :integer
    add_index :payments, :bill_id
  end
end

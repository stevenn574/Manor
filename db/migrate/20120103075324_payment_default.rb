class PaymentDefault < ActiveRecord::Migration
  def up
    change_column_default(:payments, :paid, false)
    Payment.update_all(:paid => false)
  end

  def down
  end
end

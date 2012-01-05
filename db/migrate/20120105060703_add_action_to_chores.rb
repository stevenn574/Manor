class AddActionToChores < ActiveRecord::Migration
  def change
    add_column :chores, :action, :string
  end
end

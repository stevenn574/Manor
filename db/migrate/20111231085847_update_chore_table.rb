class UpdateChoreTable < ActiveRecord::Migration
  def up
    remove_column :chores, :action
    remove_column :chore_types, :user_id
    add_column :chores, :chore_type_id, :integer
  end

  def down
  end
end

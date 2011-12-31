class CreateChoreTypeTable < ActiveRecord::Migration
  def up
    create_table :chore_types do |t|
      t.string :action
      t.integer :points
      t.integer :user_id
    end
  end

  def down
    drop_table :chore_types
  end
end

class CreateChoresTable < ActiveRecord::Migration
  def up
    create_table :chores do |t|
      t.string :action
      t.integer :user_id
    end
    
  end

  def down
    drop_table :chores
  end
end

class AddTimestampsToChores < ActiveRecord::Migration
  def change
    change_table :chores do |t|
      t.timestamps
    end
    
    Chore.update_all(:created_at => Time.now)
    Chore.update_all(:updated_at => Time.now)
  end
end

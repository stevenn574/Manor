class AddPointsToChores < ActiveRecord::Migration
  def change
    add_column :chores, :points, :integer
    Chore.update_all(:points => 1)
  end
end

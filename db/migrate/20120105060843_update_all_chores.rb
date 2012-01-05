class UpdateAllChores < ActiveRecord::Migration
  def up
    Chore.all.each do |chore|
      chore.action = chore.chore_type.action
      chore.save
    end
  end

  def down
  end
end

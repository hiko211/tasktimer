class AddGoaltimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :goaltime, :integer
  end
end

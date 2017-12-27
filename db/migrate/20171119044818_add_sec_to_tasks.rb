class AddSecToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :sec, :float
  end
end

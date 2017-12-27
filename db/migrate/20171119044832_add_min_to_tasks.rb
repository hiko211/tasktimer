class AddMinToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :min, :integer
  end
end

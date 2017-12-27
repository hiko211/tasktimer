class AddTodoIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :todo_id, :integer
  end
end

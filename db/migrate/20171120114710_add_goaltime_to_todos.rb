class AddGoaltimeToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :goaltime, :time
  end
end

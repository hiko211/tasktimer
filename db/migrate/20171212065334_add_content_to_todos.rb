class AddContentToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :content, :text
  end
end

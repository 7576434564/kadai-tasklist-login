class AddTaskuserRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :taskuser, foreign_key: true
  end
end

class Todo < ActiveRecord::Base
  #association
  belongs_to :task

  def self.todo_achieve_judge(task,todos,todo_achieves,todo_achieved)
    if todos.length != 0
      todos.each do |todo|
        if todo.achieve == true
          todo_achieves << 1
        end
      end
      if todo_achieves.length == todos.length
        todo_achieved = true
        task.achieve = true
      else
        task.achieve = false
      end
    else
      task.achieve = true
    end
    task.save
    return todo_achieved
  end
end

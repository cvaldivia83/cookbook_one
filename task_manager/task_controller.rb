require_relative 'task'
require_relative 'task_view'

class TaskController
  def initialize(repository)
    @repository = repository
    @view = TaskView.new
  end

  def list
    # Get the tasks array from the repository
    tasks_array = @repository.all

    #Orders the view to list all tasks. Sends the tasks_array to the view via parameter
    @view.list_all_tasks_to_user(tasks_array)
  end

  def create
    # Orders the view to ask the user for a description
    description = @view.ask_user_for_task

    # Creates a new instance of task
    task = Task.new(description)

    # Orders the repository to add the new task to the array
    @repository.add_task(task)
  end

  def destroy
    # Orders the view to ask the user for an index
    index = @view.ask_user_for_index

    #Orders the repository to remove a task from the tasks array
    @repository.remove_task(index)
  end

  def mark_as_done
    list

    # Orders the view to ask the user for an index
    index = @view.ask_user_for_index

    # Orders the repository to find the task on that index
    task = @repository.find(index)

    # Orders the model to mark the task as done
    task.mark_as_done!
  end
end

class TaskView
  def ask_user_for_task
    puts "Type a new task you wish to save"
    gets.chomp
  end

  def list_all_tasks_to_user(tasks_array)
    puts "Here's the list of tasks:"
    puts ">"
    tasks_array.each_with_index do |element, index|
      puts "#{index + 1} - #{element.done ? "[X]" : "[ ]"} - #{element.description}"
    end
  end

  def ask_user_for_index
    puts "Which task would you like to select?"
    gets.chomp.to_i - 1
  end
end

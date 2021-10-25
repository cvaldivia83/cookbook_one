class View
  def list_recipes_to_user(recipes_array)
    recipes_array.each_with_index do |item, index|
      puts "#{index + 1} - #{item.name} - #{item.description}"
    end
  end

  def ask_user_for_recipe
    puts "What is the name of your recipe?"
    name = gets.chomp
    puts "What is the description of your recipe?"
    description = gets.chomp
    [name, description]
  end

  def ask_user_for_index
    puts "Which recipe would you like to delete?"
    gets.chomp.to_i - 1
  end
end

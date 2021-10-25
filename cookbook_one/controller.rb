require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes_array = @cookbook.all
    @view.list_recipes_to_user(recipes_array)
  end

  def create
    new_recipe_array = @view.ask_user_for_recipe
    recipe = Recipe.new(new_recipe_array[0], new_recipe_array[1])
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end
end

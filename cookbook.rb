require 'csv'

class Cookbook
  attr_accessor :recipes
  def initialize(filepath)
    @csv_file = filepath
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe_instance|
        csv << [recipe_instance.name, recipe_instance.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end

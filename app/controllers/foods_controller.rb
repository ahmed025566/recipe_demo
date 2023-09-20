class FoodsController < ApplicationController
  def new
    @food = Food.new
    @recipe = Recipe.find(params[:recipe])
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food)
  end

  def create
    @food = Food.new(food_params)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: 10)

    # Save the recipe_food object
    @recipe_food.save

    if @food.save
      redirect_to recipes_path, notice: "Food was successfully created."
    else
      render :new, notic: 'Please try again'
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :recipes)
  end
end

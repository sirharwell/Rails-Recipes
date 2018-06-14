class RecipeIngredientsController < ApplicationController

  def new
    # this is for the options_for_select on the form
    # Example: ['Buffalo Chicken Dip', 1]
    # Example: ['Ranch Potatoes', 3]
    # The first element in the array is the display value for the select option
    # The second element in the array is the value that gets submitted to the server
    # http://apidock.com/rails/v4.2.1/ActionView/Helpers/FormOptionsHelper/options_for_select
    @recipes = Recipe.all.map{ |r| [r.name, r.id] }
    @ingredients = Ingredient.all.map{ |i| [i.name, i.id] }
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    if @recipe_ingredient.save
        flash[:success] = 'Ingredient Added'
        redirect_to :back
    else
        render :new
    end
  end

  def destroy
    recipe_ingredient = RecipeIngredient.find(params[:id])
    recipe_ingredient.destroy
    flash[:success] = 'Ingredient Removed!'
    redirect_to recipe_path(recipe_ingredient.recipe_id)
  end

  private
    def recipe_ingredient_params
        params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount)
    end
end

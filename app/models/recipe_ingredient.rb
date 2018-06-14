class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  # This table will look something like this
  # has_many :through is good here because we only have to create an ingredient once
  # once that ingredient is created we create a new recipe record and a new recipe_ingredient record
  # this links each new recipe up with the ingredient that is already in the database

  # recipe_id | ingredient_id
  #      1          1
  #      1          3
  #      2          1
  #      10         3

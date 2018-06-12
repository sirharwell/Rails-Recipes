class Ingredient < ApplicationRecord
    # Validations
    validates_presence_of :name
    # This ensures that we do not have duplicate of the same named ingredients in our database
    validates_uniqueness_of :name, case_sensitive: false

    # Associations
    has_many :recipe_ingredients, dependent: :destroy
    has_many :recipes, through: :recipe_ingredients
end

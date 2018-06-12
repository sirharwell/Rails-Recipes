class Recipe < ApplicationRecord
    # Validations
    validates_presence_of :name

    # Assocations
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
end

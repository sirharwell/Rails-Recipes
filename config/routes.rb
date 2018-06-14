Rails.application.routes.draw do
  get 'recipes/index'

  get 'recipes/show'

  get 'recipes/new'

  get 'recipes/edit'

    root 'recipes#index'

    resources :ingredients
    resources :recipes
    resources :recipe_ingredients, only: [:new, :create, :destroy]
end

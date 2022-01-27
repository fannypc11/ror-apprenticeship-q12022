Rails.application.routes.draw do
  devise_for :users
  root 'pokemons#index'

  resources :pokemons do
    member do
      get :delete
    end
  end
  #get 'pokemon/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'pokemon/edit'
end

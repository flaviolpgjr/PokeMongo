Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'pokemon/:name', to:'pokemons#pokemon', via: [:get]
end

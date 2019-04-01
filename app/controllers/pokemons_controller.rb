class PokemonsController < ApplicationController
    def pokemon
        pokemon = PokemonApiService.get_pokemons(params[:name]) 
        render json: pokemon, root: "pokemon", adapter: :json
    end
end

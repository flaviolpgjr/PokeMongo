class PokemonApiService
    require 'open-uri'
    def self.parser(name)
        html = Nokogiri::HTML(open("http://dentrodapokebola.com/jogos/pokemon-go/lista-de-pokemon/"))
        @pokemon = {}
        html.css('tr:not(:first-child)').each do |pokemon|
            name_pokemon = pokemon.css('td:not(:first-child)')[0].text.gsub("\n","")
            if name_pokemon == name
                atacks_pokemon = pokemon.css('td:not(:first-child)')[3].text.split("\n")
                special_atacks_pokemon = pokemon.css('td:not(:first-child)')[4].text.split("\n")
                image_url = pokemon.css('td:not(:first-child) > img')[0]["src"]
                @pokemon = Pokemon.create(name:name_pokemon, atacks: atacks_pokemon, special_atacks:special_atacks_pokemon, image_url: image_url)
            end
        end
        @pokemon
    end

    def self.get_pokemons(name)
        name_pokemon = name.capitalize
        pokemon = Pokemon.where(name:name_pokemon)
        if pokemon.count == 0
            parser(name_pokemon)
        else
            pokemon[0]
        end
    end

end
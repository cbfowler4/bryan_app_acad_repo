@pokemons.each do |pokemon| 
  json.set! pokemon.id do 
    json.partial! "pokemon", pokemon: pokemon
  end
end
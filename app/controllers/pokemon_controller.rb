class PokemonController < ApplicationController

  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    name  = body["name"]
    id = body["id"]
    types = body["types"]

      types_array = []
      types.map do |type|
        types_array << type["type"]["name"]
      end

    render json:
      { "name": name, "id": id, "types": types_array }
  end

end

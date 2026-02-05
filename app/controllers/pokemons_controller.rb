class PokemonsController < ApplicationController
  def show
    # pega o id ou nome
    nome = params[:id]

    # define o serviço que vai buscar os dados do poke, requisitando a class
    resultado = PokemonService.new(nome).execute

    # usei um if para trazer a resposta, se tiver resultado ele traz o resultado, se não tiver ele traz a mensagem de erro
    if resultado
      render json: resultado, status: :ok
    else
      render json: { erro: "Pokémon não encontrado" }, status: :not_found
    end
  end
end
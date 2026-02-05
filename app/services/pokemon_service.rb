class PokemonService
  include HTTParty # chama o httparty pra fazer as requisições
  base_uri 'https://pokeapi.co/api/v2' # endereço da base do pokeapi

  def initialize(nome_ou_id) #defini a função que recebe o nome ou id do poke
    @pokemon = nome_ou_id.to_s.downcase
  end

  def execute
    # busca os dados dos poke na api
    response = self.class.get("/pokemon/#{@pokemon}")

    # se ele não encontrar vai retornar nil
    return nil unless response.success?

    # informações que vão responder
   {
      id: response['id'],
      name: response['name'],
      types: response['types'].map { |t| t['type']['name'] }, # pega o nome dos tipos
      weight: response['weight'],
      height: response['height'],
      base_experience: response['base_experience']
    }
  end
end
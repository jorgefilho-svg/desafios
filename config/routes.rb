Rails.application.routes.draw do
  get 'pokemons/:id', to: 'pokemons#show' #ir para o controller pokemon e executar a ação show
end

Dummy::Application.routes.draw do
  resource :store, only: [:show]

  root 'stores#show'

end

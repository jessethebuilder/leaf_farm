Dummy::Application.routes.draw do
  # resource :store, only: [:show]

  resource :dispensary, :only => [:show] do
    #get 'menu'
    #get 'info'
  end

  get 'menu', :to => 'dispensaries#menu', :as => 'menu'
  get 'info', :to => 'dispensaries#info', :as => 'info'

  root 'dispensaries#show'

end

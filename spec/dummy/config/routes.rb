Dummy::Application.routes.draw do
  devise_for :patients
  # resource :store, only: [:show]

  resource :dispensary, :only => [:show] do
    #get 'menu'
    #get 'info'
  end

  # resource :patient_profiles

  get 'menu', :to => 'dispensaries#menu', :as => 'menu'
  get 'info', :to => 'dispensaries#info', :as => 'info'

  root 'dispensaries#show'

end

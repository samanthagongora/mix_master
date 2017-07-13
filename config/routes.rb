Rails.application.routes.draw do
  resources :artists, except: [:destroy, :edit, :update]
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :cnabs do 
    delete :index, on: :collection, action: :delete_all
    collection { post :import}
  end
  resources :deals
  root 'cnabs#index'
end

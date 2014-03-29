Twilio::Application.routes.draw do
  devise_for :users
  root 'people#index'

  resources :people do
    resources :messages, only: [:create, :new]
  end

end

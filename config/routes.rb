Twilio::Application.routes.draw do
  root 'people#index'

  resources :people do
    resources :messages, only: [:create, :new]
  end

end

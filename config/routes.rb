Rails.application.routes.draw do
  root to: 'surveys#index'

  resources :surveys do
    get 'add_question', to: 'surveys#add_question'
  end
end

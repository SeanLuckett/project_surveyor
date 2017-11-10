Rails.application.routes.draw do
  root to: 'surveys#index'

  resources :surveys do
    get 'configure_question', to: 'surveys#configure_question'
    get 'add_question', to: 'surveys#add_question'
  end
end

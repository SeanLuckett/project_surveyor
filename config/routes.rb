Rails.application.routes.draw do
  root to: 'surveys#index'

  resources :surveys do
    get 'add_question', to: 'surveys#add_question'
    get 'build_question', to: 'multi_choice_questions#build_question'

    resources :multi_choice_questions, shallow: true, except: :index
  end

end

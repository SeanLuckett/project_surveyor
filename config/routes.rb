Rails.application.routes.draw do
  root to: 'surveys#index'

  namespace :take do
    get 'survey/:id', to: 'survey_takers#show', as: :survey
    post 'survey/:id/tally', to: 'survey_takers#record_answers', as: :survey_tally
  end

  namespace :results do
    get 'survey/:id/results', to: 'survey_results#show', as: :view_survey
  end

  resources :surveys do
    get 'add_question', to: 'surveys#add_question'
    get 'build_question', to: 'multi_choice_questions#build_question'

    resources :multi_choice_questions, shallow: true, except: :index
  end

end

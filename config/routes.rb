Rails.application.routes.draw do
  delete '/questionss/:id/destroy', to: 'questions#destroy', as: :test_questions

  resources :tests do
    resources :questions, shallow: true
  end
end

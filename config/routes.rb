Rails.application.routes.draw do
  root 'books#index'
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  resources :books

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

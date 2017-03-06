Rails.application.routes.draw do

  devise_for :users
  
  root "main#index"

  match '/404', to: 'errors#not_found', as: :error_404, via: :all
  match '/500', to: 'errors#internal_server_error', as: :error_500, via: :all

  namespace :admin do
    root "main#index"
    get ':entry_type', to: 'entries#index', as: 'entry_type'
    resources :entries, only: [:new, :edit, :create, :update, :destroy], path: ':entry_type'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end

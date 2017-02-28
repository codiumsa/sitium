Rails.application.routes.draw do

  root "main#index"

  match '/404', to: 'errors#not_found', as: :error_404, via: :all
  match '/500', to: 'errors#internal_server_error', as: :error_500, via: :all

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end

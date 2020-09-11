Rails.application.routes.draw do
  root to: 'cards#index'
  resources :cards, expect: [:destroy]
  delete '/cardsdestroy', to: 'cards#destroy', as: 'cardsdestroy'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope format: false do
    resources :payments, only: [:index, :show]
  end
end

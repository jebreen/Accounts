Rails.application.routes.draw do
  resources :journal_lines
  resources :journals
  resources :accounts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  controller :reports do
    post 'reports', action: :create
    get 'reports', action: :index
    #    get 'reports/balance_sheet'
    get 'reports/balance_sheet(/:date)', action: :balance_sheet
    get 'reports/trial_balance'
    get 'reports/profit_loss'
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root "accounts#index"
end

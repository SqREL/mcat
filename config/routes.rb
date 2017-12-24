Rails.application.routes.draw do
  root 'requests#new'

  resource :request, only: %i[create new] do
    get :result
  end
end

Rails.application.routes.draw do
  resources :emergencies, only: [:create, :index]
  match '*path', to: 'errors#catch_404', via: :all
end

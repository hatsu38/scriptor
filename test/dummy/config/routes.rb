Rails.application.routes.draw do
  resources :articles
  mount Scriptor::Engine => "/scriptor"
end

Scriptor::Engine.routes.draw do
  resources :scripts, only: %i[index show], param: :filename do
    post :run, on: :member
  end

  root to: "scripts#index"
end

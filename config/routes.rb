Rails.application.routes.draw do

  resources :games, only: [:new, :show, :create], param: :game_id do
    resource :attack, only: [:create]
  end

  root to: "games#new"
end

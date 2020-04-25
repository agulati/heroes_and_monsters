Rails.application.routes.draw do

  resources :games, only: [:new, :show, :create], param: :game_id do
    resource :attack, only: [:create]
    resources :quests, only: [:new, :show, :create, :update]
  end

  root to: "games#new"
end

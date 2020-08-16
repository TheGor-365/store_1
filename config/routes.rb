Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  get "admin/users_count" => "admin#users_count"
end

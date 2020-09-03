Rails.application.routes.draw do
  get "/" => "homes#index"
  get "/roots" => "homes#show"

  #Twitterログイン・ログアウト用のルーティング
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  #ユーザー関連のルーティング
  get "/users/:uid" => "users#show"

  #なぞなぞ関連のルーティング
  get "/themes" => "themes#new"
  post "/themes" => "themes#create"
  post "/themes/:id/add" => "themes#add"
  delete "/themes/:id/destroy" => "themes#destroy"
  get "/themes/:id" => "themes#show"
  get "/themes/:id/summary" => "themes#result"
end

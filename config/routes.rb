Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top#index"
  get "top/index" => "top#index"

  # Listに関するルーティング
  get 'list/new'
  post 'list/create'
  # editアクション,update,destroyアクションの生成
  resources :list, only: %i(new create edit update destroy) do
    # ネスト構造にすることで親子関係をルーティングで表すことができる。
    # cardに関してはlistに対して「子」の関係になるから、ネストすることで、どのリストに紐づくかを明示できる。
    resources :card, only: %i(new create)
  end
end

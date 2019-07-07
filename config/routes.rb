Rails.application.routes.draw do  
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  get 'inquiry' => 'inquiry#index' #入力画面
  post 'inquiry/confirm' => 'inquiry#confirm' #確認画面
  post 'inquiry/thanks' => 'inquiry#thanks' #送信完了画面
end

Rails.application.routes.draw do

  get 'favorites/index'
  devise_for :users
  root 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, only: [:show, :edit, :update] do
		resources :favorites, only: [:index]  #お気に入り
	end

	namespace :admin do
    resources :users, only: [:index,:destroy]
    resources :shops, only: [:index,:destroy]
  	end

	resources :shops do
		resources :post_comments, only: [:create,:destroy] #コメント機能
		resource :favorites, only: [:create, :destroy]  #お気に入り
	end

end

Rails.application.routes.draw do
  root 'main#index'

  patch 'contents/:id/edit' => 'contents#edit'
  get 'contents/:id' => 'contents#update'
  get 'contents/:id/new' => 'contents#new'
  get 'contents/:id/edit' => 'contents#edit'
  post 'contents/create'

  get 'post/new'
  post 'post/create'
  post 'post/search'
  get 'posts/:id' => 'post#detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

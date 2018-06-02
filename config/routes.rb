Rails.application.routes.draw do
  patch 'contents/:id/edit' => 'contents#edit'
  get 'contents/:id' => 'contents#update'
  get 'contents/:id/new' => 'contents#new'
  get 'contents/:id/edit' => 'contents#edit'
  post 'contents/create'
  get 'main/index'
  get 'post/new'
  get 'post/create'
  get 'post/search'
  get 'posts/:id' => 'post#detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

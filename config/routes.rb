Rails.application.routes.draw do
  patch 'contents/:id' => 'contents#edit'
  get 'contents/:id' => 'contents#update'
  get 'contents/:postId/new' => 'contents#new'
  post 'contents/create'
  get 'main/index'
  get 'post/new'
  get 'post/create'
  get 'post/search'
  get 'posts/:id' => 'post#detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

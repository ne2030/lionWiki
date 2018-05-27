Rails.application.routes.draw do
  get 'main/index'
  get 'post/new'
  get 'post/create'
  get 'post/edit'
  get 'post/update'
  get 'post/search'
  get 'post/detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

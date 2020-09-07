Rails.application.routes.draw do
   devise_for :users
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  get 'blogs' => 'blogs#index'
  get 'blogs/new' => 'blogs#new'
  post 'blogs' => 'blogs#create'
  delete 'blogs/:blog_id' => 'blogs#destroy'
  patch 'blogs/:blog_id' => 'blogs#update'
  get 'blogs/:blog_id/edit' => 'blogs#edit'
  get 'blogs/:blog_id' => 'blogs#show'
  get 'users/:id' => 'users#show'
  
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
end

Rails.application.routes.draw do

  root 'books#index'

  resources :books do
    member do
      get :delete
    end
  end

  #get 'books/index'
  #get 'books/add'
  #get 'books/update'
  #get 'books/show'
  #get 'books/delete'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

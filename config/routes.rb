# Rails.application.routes.draw do
  # get 'item/index'
#   devise_for :users
#   get 'home/index'
#   root to: "home#index" 
# end


Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "home#index" 
  # get  "order", to:"order#index"
#   resources :orders do
#     resources :items do
#     end
    
# end
resources :items do
       end
end



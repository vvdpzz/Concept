Concept::Application.routes.draw do
  devise_for :users

  resources :photos
  
  # post comment
  post 'comments/create'
  
  # tagged
  match 'tagged/:tag'       => 'tagged#index',      :via => 'get',  :as => :tagged

  resources :questions do
    resources :answers do
      resources :comments
    end
    resources :comments
    get :autocomplete_tag_name, :on => :collection
  end
  
  root :to => "questions#index"
end

Concept::Application.routes.draw do
  devise_for :users

  resources :photos do
    resources :comments
  end
  match 'questions/:id/upload' => 'photos#upload', :via => 'post', :as => :upload
    
  # post comment
  post 'comments/create'
  
  # tagged
  match 'tagged/:tag' => 'tagged#index', :via => 'get', :as => :tagged

  resources :questions do
    resources :comments
    get :autocomplete_tag_name, :on => :collection
  end
  
  root :to => "questions#index"
end

Rails.application.routes.draw do
  devise_scope :user do
    get "/users/:id/settings" => "registrations#edit", :as => :edit_user_registration
  end

  devise_for :users, :controllers => { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  resources :users do
  	resources :petitions
  end

  resources :colleges do
  	resources :petitions do
      resources :ideas, only: [:create] do
        resources :likes, only: [:create, :destroy]
      end
      resources :alliances, only: [:create]
      resources :signatures, only: [:create]
    end
  end

  get "/colleges/:college_id/search" => "petitions#search", :as => :college_petitions_search
  get "/colleges/:college_id/popular" => "petitions#popular", :as => :college_petitions_popular
  get "/colleges/:college_id/recent" => "petitions#recent", :as => :college_petitions_recent
  get "/colleges/:college_id/tag" => "petitions#tag", :as => :college_petitions_tag
end

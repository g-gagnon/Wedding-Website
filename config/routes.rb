Rails.application.routes.draw do

  root 'pages#index'

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end

  devise_for :users

  get '/blog', to: 'pages#blog'
  get '/blog-single', to: 'pages#blog'
  get '/bridesmaids', to: 'pages#blog'
  get '/contacts', to: 'pages#blog'
  get '/page', to: 'pages#blog'
  get '/photos', to: 'pages#blog'
  get '/rsvp', to: 'pages#rsvp'
end

Rails.application.routes.draw do

  root 'pages#index'

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_out" => "devise/sessions#destroy"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/blog', to: 'pages#blog'
  get '/blog-single', to: 'pages#blog'
  get '/bridesmaids', to: 'pages#bridgemails'
  get '/contacts', to: 'pages#contacts'
  get '/page', to: 'pages#page'
  get '/photos', to: 'pages#photos'
  get '/rsvp', to: 'pages#rsvp'
  get '/venue', to: 'pages#venue'


end

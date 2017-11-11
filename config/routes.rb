Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope "(:locale)", locale: /en|fr/ do
    devise_scope :user do
      get "/sign_in" => "devise/sessions#new"
      get "/sign_out" => "devise/sessions#destroy"
      get "/sign_up" => "devise/registrations#new"
    end

    get '/blog', to: 'pages#blog'
    get '/blog-single', to: 'pages#blog'
    get '/bridesmaids', to: 'pages#bridesmaids'
    get '/contact', to: 'pages#contact'
    get '/page', to: 'pages#page'
    get '/photos', to: 'pages#photos'
    get '/venue', to: 'pages#venue'

    get '/rsvp', to: 'rsvp#rsvp'
    match '/code', to: 'rsvp#code', via: [:get, :post]
    resource :rsvp, controller: 'rsvp'


    get '/:locale' => 'pages#index'
    root 'pages#index'
  end

end

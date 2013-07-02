MtaRails::Application.routes.draw do

  get "/choice", to: "home#result"
  get "/", to: "home#home"
  root to: 'home#home'

end

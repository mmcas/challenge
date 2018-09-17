Rails.application.routes.draw do
 
  root 'house_shows#index'
  get 'house_shows', to: 'house_shows#index'

end

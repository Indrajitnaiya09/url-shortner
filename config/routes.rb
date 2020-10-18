Rails.application.routes.draw do
  post '/urls', to: 'urls#create'
  get '/stat', to: 'urls#stat'
  get '/:unique_name', to: 'urls#show'
end

Rails.application.routes.draw do
  post '/urls', to: 'urls#create'
  get '/:unique_name', to: 'urls#show'
end

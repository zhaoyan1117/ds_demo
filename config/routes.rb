Rails.application.routes.draw do
  root 'sequoia#show'

  get '/sequoia_number', to: 'sequoia#show'

  get '/sequoia_number/search', to: 'sequoia#search',
                                as: :search_sequoia_number_path
end

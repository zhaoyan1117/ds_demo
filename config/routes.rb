Rails.application.routes.draw do
  get 'static/about'

  root 'sequoia#show'

  get '/sequoia_number', to: 'sequoia#show',
                         as: :sequoia_number

  get '/sequoia_number/search', to: 'sequoia#search',
                                as: :search_sequoia_number
  get '/sequoia_number/auto_complete', to: 'sequoia#auto_complete',
                                       as: :search_auto_complete

  get '/about', to: 'statics#about',
                as: :about
end

Rails.application.routes.draw do
  root 'sequoia#show'

  get '/sequoia_number', to: 'sequoia#show',
                         as: :sequoia_number

  get '/sequoia_number/search', to: 'sequoia#search',
                                as: :search_sequoia_number
  get '/sequoia_number/auto_complete', to: 'sequoia#auto_complete',
                                       as: :search_auto_complete

  get '/about', to: 'statics#about',
                as: :about

  get '/investment/nasdaq', to: 'investment#show_nasdaq',
                            as: :nasdaq_analysis
  get '/investment/unemployment', to: 'investment#show_unemployment',
                            as: :unemployment_analysis
end

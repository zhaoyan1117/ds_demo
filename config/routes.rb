Rails.application.routes.draw do
  root 'searches#sequoia_number'
  get '/sequoia_number', to: 'searches#sequoia_number',
                         as: :sequoia_number_path

  get '/search_sequoia_number', to: 'searches#search_sequoia_number',
                                as: :search_sequoia_number_path
end

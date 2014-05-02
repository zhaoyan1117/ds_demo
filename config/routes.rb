Rails.application.routes.draw do
  root 'searches#sequoia_number'
  get '/search/sequoia_number', to: 'searches#sequoia_number',
                                as: :sequoia_number_path
end

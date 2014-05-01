require_relative 'importer'

Importer.new("#{Rails.root}/db/data.csv").import_data

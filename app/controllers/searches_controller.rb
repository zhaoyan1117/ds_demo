class SearchesController < ApplicationController
  def sequoia_number
    name = params[:name]

    @path = ShortestPathToSequoia.new(name).find
  end
end

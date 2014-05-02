class SearchesController < ApplicationController
  def sequoia_number
    source = params[:source]
    target = params[:target]

    @path = ShortestPathFinder.new(source, target).find
  end
end

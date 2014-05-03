class SearchesController < ApplicationController
  def sequoia_number
  end

  def search_sequoia_number
    @source = params[:source]
    @target = params[:target]

    unless !@source.try(:empty?) && !@target.try(:empty?)
      return render json: {error: 'Please specify both source and target!'}
    end

    @path = ShortestPathFinder.new(@source, @target).find

    if @path
      render json: @path
    else
      render json: {error: "No path find between #{@source} and #{@target}!"}
    end
  end
end

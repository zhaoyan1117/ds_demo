class SequoiaController < ApplicationController
  def show
  end

  def search
    @source = params[:source]
    @target = params[:target]

    unless !@source.try(:empty?) && !@target.try(:empty?)
      return render json: {error: 'Please specify both source and target!'}
    end

    @path = ShortestPathFinder.new(@source, @target).find

    logger.debug { "Search path:" }
    logger.debug { @path.to_s }

    if @path
      render json: @path
    else
      render json: {error: "No path find between #{@source} and #{@target}!"}
    end
  end

  def auto_complete
    term = params['term']
    results = Investor.where(Investor.arel_table[:name].matches("%#{term}%"))
                      .order(name: :asc).limit(15).pluck(:name)

    logger.debug { "Auto Complete:" }
    logger.debug { results }

    render json: results
  end
end

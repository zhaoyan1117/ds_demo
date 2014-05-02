class ShortestPathFinder
  def initialize(source, target)
    @source = Investor.where(Investor.arel_table[:name].matches("#{source}%"))
                      .order(name: :asc).first
    @target = Investor.where(Investor.arel_table[:name].matches("#{target}%"))
                      .order(name: :asc).first
  end

  def find
    return nil unless @source && @target
    Path.new(@source.node.shortest_path_to(@target.node)
                         .incoming(:investment)
                         .depth(100).nodes.first)
  end
end

class ShortestPathToSequoia
  SEQUOIA = 9254

  attr_reader :neo_id

  def initialize(name)
    if name
      investors = Investor.where(Investor.arel_table[:name]
                                         .matches("#{name}%"))
                          .order(name: :asc)
      @investor = investors.first
    else
      @investor = nil
    end
  end

  def find
    return nil unless @investor

    sequoia = Investor.find_by_id(SEQUOIA).node
    target = @investor.node

    Path.new(target.shortest_path_to(sequoia)
                   .incoming(:investment)
                   .depth(100).nodes.first)
  end
end

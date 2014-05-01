class ShortestPathToSequoia
  SEQUOIA = 9254

  attr_reader :neo_id

  def initialize(name)
    fail ArgumentError, "Cannot search Investors with nil" unless name

    investors = Investor.where(Investor.arel_table[:name].matches("%#{name}%"))
                        .order(name: :asc)

    @investor = investors.first
    fail ArgumentError, "Cannot find investor: #{name}" unless @investor
  end

  def find
    sequoia = Investor.find_by_id(SEQUOIA).node
    target = @investor.node

    path = Path.new(target.shortest_path_to(sequoia)
                 .incoming(:investment)
                 .depth(100).nodes.first)
  end
end

class Path
  attr_reader :path, :company_path, :investor_path

  def initialize(path)
    return nil unless path

    @path = path.map do |node|
      if path.index(node).even?
        Investor.find_by(neo_id: node.neo_id)
      else
        Company.find_by(neo_id: node.neo_id)
      end
    end
    @investor_path = @path.values_at(*path.each_index.select {|i| i.even?})
    @company_path = @path.values_at(*path.each_index.select {|i| i.odd?})
  end

  def each(&block)
    @path.each &block
  end

  def degrees
    (@path.size+1)/2 - 1
  end

  def empty?
    return true unless @path
    @path.empty?
  end

  def to_s
    result = ''
    @path.each do |node|
      result += node.name

      unless @path.last == node
        result += node.is_a?(Investor) ? i_to_c : c_to_i
      end
    end

    result
  end

  def to_json
    to_d3_force_data.to_json
  end


  private

  def to_d3_force_data
    links = []
    0.upto(@path.size-2) do |i|
      links.push(source: i, target: i+1)
    end

    nodes = []
    @path.each do |n|
      nodes.push(name: n.name, url: n.crunchbase_link)
    end

    {links: links, nodes: nodes}
  end

  def c_to_i
    ' <-invested- '
  end

  def i_to_c
    ' -invested-> '
  end
end

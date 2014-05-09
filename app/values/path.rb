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
    return 0 unless @path
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

  def as_json(option = {})
    return nil unless @path
    to_d3_force_data.as_json(option)
  end

  private

  def to_d3_force_data
    links = []
    0.upto(@path.size-2) do |i|
      links.push(source: i, target: i+1)
    end

    nodes = []
    @path.each do |n|
      attributes = {name: n.name, url: n.crunchbase_link}

      if @path.index(n) == 0
        attributes.merge!({source: true, fixed: true, x: 70, y: 45})
      elsif n == @path.last
        attributes.merge!({target: true, fixed: true, x: 860, y: 420})
      end

      nodes.push(attributes)
    end

    {links: links, nodes: nodes}.merge(degrees: degrees)
  end

  def c_to_i
    ' <-invested- '
  end

  def i_to_c
    ' -invested-> '
  end
end

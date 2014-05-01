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

  private

  def c_to_i
    ' <-invested- '
  end

  def i_to_c
    ' -invested-> '
  end
end

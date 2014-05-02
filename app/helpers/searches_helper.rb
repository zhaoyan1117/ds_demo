module SearchesHelper
  def crunch_base_link(node)
     "http://www.crunchbase.com#{node.permalink}"
  end

  def target_value(value)
    unless value.try :empty?
      value
    else
      'Sequoia Capital'
    end
  end
end

module NodeMixin
  extend ActiveSupport::Concern

  included do
    after_create :create_node
  end

  def create_node
    my_node = Neography::Node.create({"name" => name}, $neo)
    $neo.set_label(my_node, label)

    update_attribute :neo_id, my_node.neo_id.to_i
  end

  def label
    self.class.to_s
  end

  def node
    @node ||= Neography::Node.load neo_id, $neo
  end
end

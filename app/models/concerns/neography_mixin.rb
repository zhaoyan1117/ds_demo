module NeographyMixin
  extend ActiveSupport::Concern

  included do
    after_create :create_node
  end

  def create_node
    node = Neography::Node.create("name" => name)
    $neo.set_label(node, label)

    update_attribute :neo_id, node.neo_id.to_i
  end

  def label
    self.class.to_s
  end
end

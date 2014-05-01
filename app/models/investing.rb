class Investing < ActiveRecord::Base
  belongs_to :company
  belongs_to :investor

  after_create :create_relationship

  def amount=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:amount] = num.to_i
  end

  def create_relationship
    r1 = Neography::Relationship.create(:investment,
                                        company.node, investor.node)
    r2 = Neography::Relationship.create(:investment,
                                        investor.node, company.node)
    update_attribute :neo_id, r1.neo_id.to_i
  end
end

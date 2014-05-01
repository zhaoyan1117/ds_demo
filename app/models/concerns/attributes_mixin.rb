module AttributesMixin
  extend ActiveSupport::Concern

  def update_attributes_if_nil!(attributes)
    attributes.each do |k, v|
      self.send("#{k}=", v) unless self.send("#{k}")
    end

    self.save!
  end
end
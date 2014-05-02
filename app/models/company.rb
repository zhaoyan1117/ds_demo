class Company < ActiveRecord::Base
  include AttributesMixin
  include NodeMixin

  def crunchbase_link
    "http://www.crunchbase.com#{permalink}"
  end
end

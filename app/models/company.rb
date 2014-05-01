class Company < ActiveRecord::Base
  include AttributesMixin
  include NeographyMixin
end

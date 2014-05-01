class Investor < ActiveRecord::Base
  include AttributesMixin
  include NeographyMixin
end

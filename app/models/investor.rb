class Investor < ActiveRecord::Base
  include AttributesMixin
  include NodeMixin
  include CrunchbaseMixin
end

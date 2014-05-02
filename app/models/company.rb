class Company < ActiveRecord::Base
  include AttributesMixin
  include NodeMixin
  include CrunchbaseMixin
end

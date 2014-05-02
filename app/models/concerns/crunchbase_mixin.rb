module CrunchbaseMixin
  extend ActiveSupport::Concern

  def crunchbase_link
    "http://www.crunchbase.com#{permalink}"
  end
end
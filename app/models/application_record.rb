class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.by_name
    order(:name)
  end
end

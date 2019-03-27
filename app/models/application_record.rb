class ApplicationRecord < ActiveRecord::Base
  require 'csv'
  self.abstract_class = true
end

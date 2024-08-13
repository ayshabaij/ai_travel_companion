class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_and_belongs_to_many :hobbies
end

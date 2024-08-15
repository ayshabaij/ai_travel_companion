class UserDietaryRestriction < ApplicationRecord
  belongs_to :user
  belongs_to :dietary_restriction
end

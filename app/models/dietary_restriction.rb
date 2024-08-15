class DietaryRestriction < ApplicationRecord
  has_many :user_dietary_restrictions
  has_many :users, through: :user_dietary_restrictions
end

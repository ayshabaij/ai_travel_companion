class Accessibility < ApplicationRecord
  has_many :user_accessibilities
  has_many :users, through: :user_accessibilities
end

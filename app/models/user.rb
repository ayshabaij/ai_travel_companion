class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :phone_number, format: { with: /\A\+?[1-9]\d{1,14}\z/, message: "must be a valid phone number" }, allow_blank: true
  has_many :user_hobbies
  has_many :hobbies, through: :user_hobbies
  has_many :user_dietary_restrictions
  has_many :dietary_restrictions, through: :user_dietary_restrictions
  has_many :user_accessibilities
  has_many :accessibilities, through: :user_accessibilities
  has_many :prompts, dependent: :destroy
end

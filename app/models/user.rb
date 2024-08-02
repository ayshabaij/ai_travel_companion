class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone_number, format: { with: /\A\+?[1-9]\d{1,14}\z/, message: "must be a valid phone number" }, allow_blank: true
end

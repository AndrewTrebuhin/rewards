class User < ApplicationRecord
  has_secure_token :auth_token

  attr_reader :current_password

  has_many :rewards, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :trackable, :validatable
end

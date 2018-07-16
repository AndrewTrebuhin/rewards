class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  has_many :rewards, dependent: :destroy
end

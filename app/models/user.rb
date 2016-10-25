class User < ActiveRecord::Base
  validates :username, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end

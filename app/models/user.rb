class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true

  # def self.authenticate(email, password)
  #   @user = find_by(email: email)
  #   if @user.password_digest == password
  #     @user
  #   else
  #     nil
  #   end
  # end
end

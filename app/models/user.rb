class User < ActiveRecord::Base
  validates :username, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = find_by(email: email)
    if @user.password_digest == password
      @user
    else
      nil
    end
  end
end

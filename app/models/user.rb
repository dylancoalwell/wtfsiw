require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, :presence=>true
  validates_format_of :email, :with => /.+@.+\..+/i
  validates :email, :presence=>true, :uniqueness=>true
  validates :password_hash, :presence =>true

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, sign_in_password)
    if self.email == email && self.password == sign_in_password
      return true
    end
  end
end

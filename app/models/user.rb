require 'bcrypt'
class User < ActiveRecord::Base
  has_many :workouts
  has_and_belongs_to_many :targeted_muscles
  has_many :exercises, :through => :workouts
  has_many :tips, dependent: :destroy
  has_secure_password
  validates :first_name, :last_name, :email, :username, :password_digest, presence: true

# not sure what this is...
  def password=(password)
     self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end

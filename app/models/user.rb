class User < ActiveRecord::Base
  validates :email, :first_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }, confirmation: true
  
  has_secure_password
end

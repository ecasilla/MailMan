class User < ActiveRecord::Base
  validates :email, :name, presence: true, uniqueness: true

  has_secure_password


end
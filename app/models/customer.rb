class Customer < ActiveRecord::Base
  has_many :flowers
  has_many :bouquets
  has_secure_password

  validates :username, :email, :password, presence: true
  # validates :password, presence :true
  # validates :email, presence :true

end

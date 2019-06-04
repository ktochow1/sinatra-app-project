class Customer < ActiveRecord::Base
  has_many :flowers
  has_many :bouquets

end

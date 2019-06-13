class Customer < ActiveRecord::Base
  has_many :bouquets
  has_secure_password

  validates :username, :email, :password, presence: true
  # validates :password, presence :true
  # validates :email, presence :true
  def slug
   @customer.name.downcase.gsub(" ", "-")
  end

 def self.find_by_slug(slug)
   Customer.all.find do |customer|
     customer.slug == slug
   end
 end

end

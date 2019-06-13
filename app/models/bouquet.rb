class Bouquet < ActiveRecord::Base
  belongs_to :customer
  validates :flower_quantity, numericality: true

  def slug
   name.downcase.gsub(" ", "-")
  end

 def self.find_by_slug(slug)
   Bouquet.all.find do |bouquet|
     bouquet.slug == slug
   end
 end

end

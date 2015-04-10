class Item < ActiveRecord::Base

has_many :reviews 

  def self.search(manufacturer, cateogyr)
  	if manufacturer.present? && cateogyr.present?	
	    where("manufacturer like ?", "%#{manufacturer}%") && where( "cateogyr like ?", "%#{cateogyr}%") 
	elsif manufacturer.present?
			where("manufacturer like ?", "%#{manufacturer}%")
	elsif cateogyr.present?
			where( "cateogyr like ?", "%#{cateogyr}%")
  	end
  end
end

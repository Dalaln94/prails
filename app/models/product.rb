class Product < ActiveRecord::Base
  has_many :order_items

  has_many :reviews 

    default_scope { where(active: true) }

  def self.search(manufacturer, cateogory)
  	if manufacturer.present? && cateogory.present?	
	    where("manufacturer like ?", "%#{manufacturer}%") && where( "cateogory like ?", "%#{cateogory}%") 
	elsif manufacturer.present?
			where("manufacturer like ?", "%#{manufacturer}%")
	elsif cateogory.present?
			where( "cateogory like ?", "%#{cateogory}%")
  	end
  end
end

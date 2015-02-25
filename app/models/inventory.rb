class Inventory < ActiveRecord::Base

	validates_presence_of :type_id, :brand_id

	belongs_to :type
	belongs_to :brand

end

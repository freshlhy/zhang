class Device < ActiveRecord::Base

	validates_presence_of :type_id, :brand_id, :department_id

	belongs_to :type
	belongs_to :brand
	belongs_to :department
	has_many :maintenances, -> { order('mdate desc') }

end

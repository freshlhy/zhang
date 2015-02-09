class Department < ActiveRecord::Base
	has_many :devices
end

class Maintenance < ActiveRecord::Base
  belongs_to :device

  def maintenancer_names
	  names = []
	  self.maintenancer_ids.each do |maintenancer_id| 
	    maintenancer = Maintenancer.find_by_id(maintenancer_id)
	    if maintenancer
	    	names << maintenancer.name
	    end
	  end
	  names.join(", ")
	end
	  
end

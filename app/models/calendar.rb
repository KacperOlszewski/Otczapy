class Calendar < ActiveRecord::Base

    		validates :name,
				:presence => true,
				:length => {:maximum => 100, :message => ": Za długi tytuł"}
				
    		validates :link,
				:presence => true

	scope :sort, lambda{order("calendars.position DESC")}
    
end

class Movie < ActiveRecord::Base
    
    		validates :name,
				:presence => true,
				:length => {:maximum => 100, :message => ": Za długi tytuł"}
				
    		validates :link,
				:presence => true

	scope :sort, lambda{order("movies.position DESC")}
    
end

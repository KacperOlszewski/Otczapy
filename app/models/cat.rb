class Cat < ActiveRecord::Base
	
    	has_many :workshops

		validates :name,
				:presence => true,
				:length => {:maximum => 200, :message => ": Za długi tytuł"}


	scope :sort, lambda{order("cats.position ASC")}
	scope :newest, lambda{order("cats.created_at DESC")}
    
    
end

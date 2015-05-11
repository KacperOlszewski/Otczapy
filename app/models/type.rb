class Type < ActiveRecord::Base
    	has_many :galleries, :dependent => :destroy

		validates :name,
				:presence => true,
				:length => {:maximum => 200, :message => ": Za długi tytuł"}


	scope :sort, lambda{order("types.position ASC")}
	scope :newest, lambda{order("types.created_at DESC")}
    
    
end

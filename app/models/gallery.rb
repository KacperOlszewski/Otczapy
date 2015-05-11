class Gallery < ActiveRecord::Base

	belongs_to :type
	
	has_many :photos, :dependent => :destroy

	has_attached_file :img,
					 :styles => {:medium => "400x400>", :thumb => "200x200>"}
 	
 	validates_attachment_content_type :img,
									:content_type => /^image\/(png|gif|jpeg)/,
									:message => '--- akceptuje tylko pliki PNG GIF i JPG ---'

	validates_attachment_size :img,	
								:in	=> 0..1000.kilobytes,
								:message => '--- za duży plik max rozmiar to 1 MB ---'			
								
	scope :sort, lambda{order("galleries.position DESC")}

end

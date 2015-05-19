class Slider < ActiveRecord::Base
    
    
    has_attached_file :img,
    					
					   :styles => {:medium => "400x400>", :thumb => "100x100>", :large => "1300x1300" }

 

	validates_attachment_content_type :img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"],
										:message => '--- akceptuje tylko pliki PNG GIF i JPG ---'

	validates_attachment_size :img,	
								:in	=> 0..900.kilobytes,
								:message => '--- hej! za duży plik, maxymalny rozmiar to 1000 kB ---'	




	scope :sort, lambda{order("sliders.position DESC")}
	scope :newest, lambda{order("sliders.created_at DESC")}
    
end

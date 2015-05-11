class Photo < ActiveRecord::Base
    belongs_to :gallery


	has_attached_file :img,
					 :styles => {:medium => "400x400>", :thumb => "200x200>"}

 	validates_attachment_content_type :img,
									:content_type => /^image\/(png|gif|jpeg)/,
									:message => '--- akceptuje tylko pliki PNG GIF i JPG ---'

	validates_attachment_size :img,	
								:in	=> 0..1000.kilobytes,
								:message => '--- za duży plik max rozmiar to 1 MB ---'					


	scope :sort, lambda{order("photos.position ASC")}
	scope :newest, lambda{order("photos.created_at DESC")}

end

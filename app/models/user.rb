class User < ActiveRecord::Base
    	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates   :name,
				:presence => {:in => true, :message => "pole nie może być puste"}

	validates   :surname,
				:presence => true

	validates   :user,
				:length => {:within => 4..40, :message => "Login za krótki, bądź za długi"},
				:uniqueness => true

	validates :email,
			  :presence => true,
			  :length => {:maximum => 80},
			  :format => {:with => EMAIL_REGEX, :message => "niepoprawny format"},
			  :confirmation => true
			  
	has_attached_file :img,
					 :styles => {:medium => "400x400>", :thumb => "200x200>"}

 	validates_attachment_content_type :img,
									:content_type => /^image\/(png|gif|jpeg)/,
									:message => '--- akceptuje tylko pliki PNG GIF i JPG ---'

	validates_attachment_size :img,	
								:in	=> 0..1000.kilobytes,
								:message => '--- za duży plik max rozmiar to 1 MB ---'	

	scope :sortuj, lambda{order("position DESC, name ASC")}
end

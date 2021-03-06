class Post < ActiveRecord::Base

	validates :name, :text, :teaser, :presence => true

        
    has_attached_file :img,
					   :styles => {:medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :file


	validates_attachment_content_type :img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"],
										:message => '--- akceptuje tylko pliki PNG GIF i JPG ---'

	validates_attachment_size :img,	
								:in	=> 0..900.kilobytes,
								:message => '---hej, za duży plik - maksymalny rozmiar to 1 MB ---'	

	do_not_validate_attachment_file_type :file


	scope :sort, lambda{order("posts.position DESC")}
	scope :newest, lambda{order("posts.created_at DESC")}
end

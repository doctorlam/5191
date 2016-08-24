class Submission < ActiveRecord::Base
	belongs_to :user
	has_many :portals
	has_many :gradecategorizations 
	
	has_many :assignments, :through => :portals,  dependent: :destroy
	has_many :grades, :through => :gradecategorizations

	has_attached_file :document
  	validates_attachment_file_name :document, :matches => [/pdf\Z/, /pptx\Z/, /docx\Z/, /zip\Z/]

  	has_attached_file :image
  	validates_attachment_file_name :image, :matches => [/pdf\Z/, /pptx\Z/, /docx\Z/]

end

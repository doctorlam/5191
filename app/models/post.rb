class Post < ActiveRecord::Base
	belongs_to :user
	has_many :responses
	has_attached_file :document
	validates_attachment_file_name :document, :matches => [/pdf\Z/, /pptx\Z/, /docx\Z/,/doc\Z/, /zip\Z/, /xlsx\Z/]

		
			attr_accessor :delete_image
  			before_validation { image.clear if delete_image == '1' }
  	has_attached_file :document
		  	attr_accessor :delete_document

		    before_validation { document.clear if delete_document == '1' }
		 module DeletableAttachment
		  extend ActiveSupport::Concern

		  included do
		    attachment_definitions.keys.each do |name|

		      attr_accessor :"delete_#{name}"
		      attr_accessible :"delete_#{name}"
		      
		      before_validation { send(name).clear if send("delete_#{name}") == '1' }

		      define_method :"delete_#{name}=" do |value|
		        instance_variable_set :"@delete_#{name}", value
		        send("#{name}_file_name_will_change!")
		      end

		    end
		  end

		end
end

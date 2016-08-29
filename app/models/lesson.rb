class Lesson < ActiveRecord::Base

	has_many :objectives, :dependent => :destroy
	has_many :takeaways, :dependent => :destroy
	has_many :readings, :dependent => :destroy
	has_many :homeworks, :dependent => :destroy
	has_many :classactivitys, :dependent => :destroy
	has_many :learnings
	has_many :projects, :through => :learnings
	has_many :assignments, :through => :learnings
	acts_as_commontable
	
	
	has_attached_file :image
  	validates_attachment_file_name :image, :matches => [/pdf\Z/, /pptx\Z/, /docx\Z/]

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
 
	accepts_nested_attributes_for :objectives, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :readings, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :homeworks, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :classactivitys, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :takeaways, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

	belongs_to :user
	belongs_to :course
	acts_as_votable
  	default_scope { order('date') } 

end

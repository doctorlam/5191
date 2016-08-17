class Lesson < ActiveRecord::Base

	has_many :objectives, :dependent => :destroy
	has_many :readings, :dependent => :destroy
	has_many :homeworks, :dependent => :destroy
	has_many :classactivitys, :dependent => :destroy
	has_many :learnings
	has_many :projects, :through => :learnings
	
	has_attached_file :document2
  	attr_accessor :document2_file_name
  	validates_attachment_file_name :document2, :matches => [/pdf\Z/, /pptx\Z/, /docx\Z/]

  	has_attached_file :document
  	validates_attachment_file_name :document, :matches => [/pdf\Z/, /pptx\Z/, /docx\Z/]

	accepts_nested_attributes_for :objectives, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :readings, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :homeworks, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :classactivitys, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

	belongs_to :user
	belongs_to :course
	acts_as_commontable
	acts_as_votable
  	default_scope { order('date') } 

  	 
end

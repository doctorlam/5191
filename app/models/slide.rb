class Slide < ActiveRecord::Base
  belongs_to :slidedeck
  has_many :contentmodules, -> { order("created_at ASC") }, :dependent => :destroy
    accepts_nested_attributes_for :contentmodules, :reject_if => lambda { |a| a[:modular_content].blank? }, :allow_destroy => true

  has_many :bulleted_lists, :dependent => :destroy
  accepts_nested_attributes_for :bulleted_lists, :reject_if => lambda { |a| a[:list].blank? }, :allow_destroy => true


  has_attached_file :image, :styles => { :medium => "150x150>", :thumb => "30x30" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :bgimage, :styles => { :medium => "150x150>", :thumb => "30x30" }
  validates_attachment_content_type :bgimage, :content_type => /\Aimage\/.*\Z/

  validates :slide_order, :presence => true  #or you can also write as 'validates_presence_of :username'


end

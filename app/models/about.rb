class About < ActiveRecord::Base
	has_many :vitals, :dependent => :destroy
	has_many :materials, :dependent => :destroy

	accepts_nested_attributes_for :vitals, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :materials, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true

	belongs_to :user
end

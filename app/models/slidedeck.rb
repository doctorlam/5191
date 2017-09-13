class Slidedeck < ActiveRecord::Base
	has_many :slides, :dependent => :destroy
	accepts_nested_attributes_for :slides, :allow_destroy => true

	
end

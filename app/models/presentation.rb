class Presentation < ActiveRecord::Base
	has_many :learnings
	has_many :lessons, :through => :learnings
end

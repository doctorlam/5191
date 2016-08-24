class Assignment < ActiveRecord::Base
	has_many :portals
	has_many :submissions, :through => :portals,  dependent: :destroy
	has_many :homeworks, :through => :turnins
end

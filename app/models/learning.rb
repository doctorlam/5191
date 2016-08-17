class Learning < ActiveRecord::Base
	belongs_to :lesson
	belongs_to :project
end

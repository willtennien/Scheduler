class ProjectSolution < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :project_requirement
  has_one :available_time
  has_many :instruments
  belongs_to :user
  has_one :space
end

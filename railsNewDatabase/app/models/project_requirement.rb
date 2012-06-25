class ProjectRequirement < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_one :project_solution
  has_one :available_time
  has_many :instrument_requirements
  belongs_to :soundproofness
end
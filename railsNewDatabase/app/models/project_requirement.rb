class ProjectRequirement < ActiveRecord::Base
  attr_accessible :id, :name, :description, :duration, :user, :user_id, :project_solution, :available_time, :instrument_requirements, :soundproofness
  belongs_to :user
  has_one :project_solution
  has_one :available_time, through: :user
  has_many :instrument_requirements
  belongs_to :soundproofness
end
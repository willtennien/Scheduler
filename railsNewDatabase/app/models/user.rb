class User < ActiveRecord::Base
  attr_accessible :id, :username, :password, :available_time, :instruments, :spaces, :project_requirements, :project_solutions, :sessions
  has_one :available_time
  has_many :instruments
  has_many :spaces
  has_many :project_requirements
  has_many :project_solutions
  has_many :sessions
end
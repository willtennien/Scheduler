class Instrument < ActiveRecord::Base
  attr_accessible :id, :user, :instrument_name, :project_solution
  belongs_to :user
  belongs_to :instrument_name
  belongs_to :project_solution
end

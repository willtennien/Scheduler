class Instrument < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :instrument_name
  belongs_to :project_solution
end

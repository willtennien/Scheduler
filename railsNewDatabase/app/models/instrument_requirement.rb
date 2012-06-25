class InstrumentRequirement < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :instrument_name
  belongs_to :project_requirement
end

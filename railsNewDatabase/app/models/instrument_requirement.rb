class InstrumentRequirement < ActiveRecord::Base
  attr_accessible :id, :instrument_name, :project_requirement, :project_requirement_id
  belongs_to :instrument_name
  belongs_to :project_requirement
end
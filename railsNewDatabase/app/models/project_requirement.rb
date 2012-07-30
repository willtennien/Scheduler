class ProjectRequirement < ActiveRecord::Base
  attr_accessible :id, :name, :description, :duration, :user, :user_id, :project_solution, :available_time, :instrument_requirements, :soundproofness
  belongs_to :user
  has_one :project_solution
  has_one :available_time, through: :user
  has_many :instrument_requirements
  belongs_to :soundproofness

  validates :name, :duration, :soundproofness, presence: true

  def require_instruments_by_name_count instrument_names
  	print "In require_instruments_by_name_count: "; p instrument_names
    InstrumentRequirement.where(project_requirement_id: self.id).each do |req|
      req.destroy
    end
  	instrument_names.each do |instr|
  	  if InstrumentName.is? instr[:name]
  	    instr[:min].times do
  	      InstrumentRequirement.create instrument_name: InstrumentName.find_by_value(instr[:name]), project_requirement_id: self.id
  	    end
  	  end
  	end
  end
end
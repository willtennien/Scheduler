class InstrumentName < ActiveRecord::Base
  attr_accessible :id, :value
  KNOWN_INSTRUMENTS = ["guitar"] 

  has_many :instrument_requirements
  has_many :instruments

  validates :value, inclusion: KNOWN_INSTRUMENTS

end

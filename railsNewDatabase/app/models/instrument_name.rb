class InstrumentName < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :instrument_requirements
  has_many :instruments

end

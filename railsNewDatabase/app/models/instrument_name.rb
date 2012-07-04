class InstrumentName < ActiveRecord::Base
  attr_accessible :id, :value
  KNOWN_INSTRUMENTS = ["Guitar"] 

  has_many :instrument_requirements
  has_many :instruments

  validates :value, inclusion: KNOWN_INSTRUMENTS

  def to_s
  	return self.value
  end

  class << self
  	def create_all
  		KNOWN_INSTRUMENTS.each do |str|
  			InstrumentName.create(value: str)
  		end
  	end

  	def is? string
  		return KNOWN_INSTRUMENTS.include? string
  	end
  end
end

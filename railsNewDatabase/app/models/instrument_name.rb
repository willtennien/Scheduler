class InstrumentName < ActiveRecord::Base
  attr_accessible :id, :value
  KNOWN_INSTRUMENTS = ["guitar"] 

  def create 
  	v = params[:value]
  	if KNOWN_INSTRUMENTS.contains? v
  		InstrumentName.new(value: v)
  	else
  		redirect_to new_instrument_name_path, notice: "\"#{v}\" is not a valid instrument_name."
  		raise " ! error: \"#{v}\" is not a valid instrument_name."
  	end
  end

  has_many :instrument_requirements
  has_many :instruments

end

class Soundproofness < ActiveRecord::Base
  attr_accessible :id, :name, :spaces, :project_requirements
  has_many :spaces
  has_many :project_requirements

  ORDERED = ["loud","eh","quiet"]

  validates :name, inclusion: ORDERED

  def to_i
  	if ((i = ORDERED.index(self.name)))
  		return i
  	else
  		raise " ! error: #{self} tried to convert itself to a number, but could not find its name, #{self.name} in ORDERED: #{ORDERED}."
  	end
  end

  def to_s
    return name
  end

  def self.is? string
    return ORDERED.include? string
  end

  def self.highest
    return ORDERED[-1]
  end

  def self.lowest
    return ORDERED[0]
  end

  def self.create_all
    ORDERED.each do |name|
      Soundproofness.create(name: name)
    end
  end
end
class Space < ActiveRecord::Base
  attr_accessible :id, :soundproofness, :user, :user_id, :project_solution
  belongs_to :soundproofness
  belongs_to :user
  has_one :project_solution
end

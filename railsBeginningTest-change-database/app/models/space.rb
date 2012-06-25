class Space < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :soundproofness
  belongs_to :user
  has_one :project_solution
end

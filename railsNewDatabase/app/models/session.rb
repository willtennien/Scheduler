class Session < ActiveRecord::Base
  attr_accessible :id, :user
  belongs_to :user
end

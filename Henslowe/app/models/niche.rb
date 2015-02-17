class Niche < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :jobs
  has_many :users, :through => :jobs
end

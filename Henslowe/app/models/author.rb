class Author < ActiveRecord::Base
  attr_accessible :bio, :birth_date, :death_date, :first_name, :last_name

  has_many :plays

  default_scope { order('last_name') } 

  def name
  	name = self.first_name + " " + self.last_name
  end

end

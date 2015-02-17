class Theater < ActiveRecord::Base
  attr_accessible :mission_statement, :name, :state, :street_address, :city, :website, :zip, :phone_number, :productions_attributes, :calendar

  has_many :productions, :dependent => :destroy
  has_many :plays, :through => :productions
  has_many :users, :through => :productions
  has_many :jobs
  has_many :users, :through => :jobs
  has_many :spaces, :dependent => :destroy

  def embed_calendar
  	embed_code = "<iframe src=\"https://www.google.com/calendar/embed?showTitle=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src="
  	spaces = self.spaces.map(&:calendar)
  	spaces.each do |s|
  		embed
  	end  	
  end
end

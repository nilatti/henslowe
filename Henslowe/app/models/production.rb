class Production < ActiveRecord::Base
  attr_accessible :end_date, :start_date, :play_id, :theater_id, :castings_attributes, :jobs_attributes, :play_title
  attr_accessor :play_title


  belongs_to :play
  accepts_nested_attributes_for :play

  belongs_to :theater

  has_many :castings, :dependent => :destroy
  accepts_nested_attributes_for :castings

  has_many :jobs, :dependent => :destroy
  accepts_nested_attributes_for :jobs

  #has_many :users, :through => :castings
  has_many :users, :through => :jobs
  has_many :characters, :through => :play

  has_many :rehearsals, :dependent => :destroy

  def is_current?
    if self.end_date >= Date.today && self.start_date <= Date.today
      return true 
    end
  end
  def is_future?
    if self.start_date > Date.today
      return true
    end
  end
  def is_past?
    if self.end_date < Date.today
      return true
    end
  end

  def name
    name = self.play.title + " at " + self.theater.name
  end
end


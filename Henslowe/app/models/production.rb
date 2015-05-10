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
    if self.play 
      name = self.play.title + " at " + self.theater.name
    end
  end

  def french_scenes_possible(date)
    #date has to be a set that includes available actors
    possible = []
    self.play.french_scenes.each do |fs|
      actors = fs.actors_called(self).to_set
      if actors.subset? date
        possible << fs
      end
    end
    possible = possible.uniq
    possible.sort! {|a,b| a.pretty_name <=> b.pretty_name }
  end
end


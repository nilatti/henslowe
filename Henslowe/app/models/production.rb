class Production < ActiveRecord::Base
  belongs_to :play
  belongs_to :theater

  has_many :castings, :dependent => :destroy
  accepts_nested_attributes_for :castings

  has_many :actors, :through => :castings
  has_many :characters, :through => :play
  attr_accessible :end_date, :start_date, :play_id, :theater_id, :castings_attributes

  def users_in_production
    actors = Array.new
    castings = Casting.find(:all, :conditions => [ 'production_id = ? AND actor_id IS NOT NULL', self.id ])
    castings.each do |c|
      unless actors.include?(c.user)
        actors << c.user
      end
    end
    actors
  end


end

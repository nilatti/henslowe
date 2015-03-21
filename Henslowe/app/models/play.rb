class Play < ActiveRecord::Base
  attr_accessible :title, :date, :number_of_acts, :acts_attributes, :characters_attributes, :scenes_attributes, :author_id, :author_first_name, :author_last_name
  attr_accessor :number_of_acts, :author_first_name, :author_last_name

  has_many :productions
  has_many :theaters, :through => :productions
  has_many :acts, :dependent => :destroy
  accepts_nested_attributes_for :acts, :allow_destroy => true
  has_many :scenes, :through => :acts
  has_many :french_scenes, :through => :scenes
  has_many :characters
  accepts_nested_attributes_for :characters, :allow_destroy => true
  
  belongs_to :author
  accepts_nested_attributes_for :author
  
  default_scope { order('authors.last_name').includes(:author) } 
  
  def total_characters
  #determines number of characters in play
    self.characters.size
  end
  
  def total_male_characters
  #determines number of male characters in play
    men = 0
    self.characters.each do |c|
      unless c.is_female?
        men+=1
      end
    end
    return men
  end
 
  def total_female_characters
  #determines number of female characters in play
    women = 0
    self.characters.each do |c|
      if c.is_female?
        women+=1
      end
    end
    return women
  end
end


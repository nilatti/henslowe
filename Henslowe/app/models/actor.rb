class Actor < User
  attr_accessible :best_role
  has_many :characters, :through => :castings

  def doubling_problems(production)
    fs = []
    problems = []
    castings = self.chars_for_production(production)
    characters = []
    castings.each do |cas|
      characters << cas.character
    end
    characters.each do |ons|
      ons.french_scenes.each do |french|
        unless fs.include?(french)
          fs << french
        else 
          problems << french
        end
      end
    end
    problems
  end

  def chars_for_production(production)
    cas = Casting.find :all, :conditions => [ 'actor_id = ? AND production_id = ?', self.id, production.id ]
  end

  def doubling_problems(production)
    fs = []
    problems = []
    castings = self.chars_for_production(production)
    characters = []
    castings.each do |cas|
      characters << cas.character
    end
    characters.each do |ons|
      ons.french_scenes.each do |french|
        unless fs.include?(french)
          fs << french
        else 
          problems << french
        end
      end
    end
    problems
  end

end

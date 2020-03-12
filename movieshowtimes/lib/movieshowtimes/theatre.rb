class Movieshowtimes::Theatre 
  
  attr_accessor :theatre, :zip 
  
  @@all = []
  
  def initialize(theatre,zip)
    @theatre = theatre 
    @zip = zip
    @@all << self 
    binding.pry
  end 
  
  def self.all 
    @@all
  end 
  
    def display_theatres
      
    end
  
  def self.destroy_all
    @@all.clear 
  end
  
end
  
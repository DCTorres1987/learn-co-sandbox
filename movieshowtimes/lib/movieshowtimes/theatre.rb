class Movieshowtimes::Theatre 
  
  attr_accessor :theatre
  
  @@all = []
  
  def initialize(theatre)
    @theatre = theatre 
  end 
  
  def self.all 
    @@all
  end 
  
  def save 
    @@all << self 
  end
  
  def self.create(theatre)
    theatre = self.new(theatre)
    theatre.save
    theatre
  end
  
  def self.find_by_name(theatre)
    @@all.detect do |name|
      name.theatre == theatre
    end
  end
  
  def self.find_or_create_by_name(theatre)
      self.find_by_name(theatre) || self.create(theatre)
  end
  
  
  def self.destroy_all
    @@all.clear 
  end
  
end
  
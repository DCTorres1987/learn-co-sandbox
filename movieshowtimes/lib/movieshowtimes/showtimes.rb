class Movieshowtimes::Showtimes
  attr_accessor :title, :description, :genres, :datetime, :ticketuri, :theatre 
  
  @@all = []
  
  def initialize(title, description, genres, datetime, ticketuri, theatre)
    @title = title
    @description = description 
    @genres = genres 
    @datetime = datetime 
    @ticketuri = ticketuri
    @theatre = theatre
    @@all << self
  end
  
  def self.all
    @@all
  end
  
   def self.find_by_name(theatre)
    @@all.detect do |name|
      binding.pry
    end
  end
  

  def self.destroy_all
    @@all.clear
  end
  
end
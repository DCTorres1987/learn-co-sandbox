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
    @@all.detect do |s|
      puts "Movie:       #{s.title}"
      puts "Genres:      #{s.genres}"
      puts "Description: #{s.description}"
      puts "-----------------------------"
      puts "Date Time:   #{s.datetime.split("T")}"
      puts "Ticket URI:  #{s.ticketuri}"
      binding.pry
    end
  end
  

  def self.destroy_all
    @@all.clear
  end
  
end
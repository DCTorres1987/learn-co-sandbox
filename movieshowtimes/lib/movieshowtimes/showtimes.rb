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
  end
  
  def self.all
    @@all
  end
  
  
   def self.movie_listing(theatre)
     puts "Here are your Movie listings. Please choose a movie for Showtimes"
     puts "-----------------------------------------------------------------"
     @@all.each do |s|
      if s.theatre == theatre 
         puts s.title 
      end 
     end 
  end
  

  def self.destroy_all
    @@all.clear
  end
  
end
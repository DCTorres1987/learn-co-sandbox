class Movieshowtimes::Showtimes
  attr_accessor :title, :description, :genres, :datetime, :ticketuri, :theatre 
  
  @@all = []
  @@movies = []
  
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
  
  def self.all_movies 
    @@movies
  end
  
  def self.movie_listings(theatre)
   self.all.each do |s| 
     if s.theatre == theatre 
        if @@movies.include?(s.title)
          nil 
        else 
          @@movies << s.title 
        end 
     end 
   end 
  end
   
   def self.showtime_listings(theatre,movie)
     self.all.each do |s|
       if s.theatre == theatre && s.title == movie 
         puts "Date/Time: #{s.datetime.split("T")}"
         puts "TicketURI: #{s.ticketuri}"
       else 
         nil
       end
     end
  end

  def self.destroy_all
    @@all.clear
    @@movies.clear
  end
  
end
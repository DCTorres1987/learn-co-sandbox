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
  
  def self.movie_listings(theatre)
   movies = []
   self.all.each do |s| 
     if s.theatre == theatre 
        if movies.include?(s.title)
          nil 
        else 
          movies << s.title 
        end 
     end 
   end 
   
   movies.each.with_index(1) do |name, index|
   puts "#{index}. " + name
   end
  end

  def self.destroy_all
    @@all.clear
  end
  
end
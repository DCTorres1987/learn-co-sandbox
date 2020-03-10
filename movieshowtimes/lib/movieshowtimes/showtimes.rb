class Movieshowtimes::Showtimes
  attr_accessor :tmsId, :rootId, :subType, :title, :releaseYear, :releaseDate, :titleLang, :descriptionLang, :entityType, :genres, :audience, :longDescription, :shortDescription, :topCast, :directors, :officialUrl, :qualityRating, :ratings, :advisories, :runTime, :animation, :preferredImage, :showtimes
  
  @@all = []
  
  def initialize(hash)
    hash.each {|k, v| self.send("#{k}=", v)}
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.display_movie_listing
      self.all.each do |movie|
      puts "                        "
      puts "Movie: #{movie.title}"
      puts "                        "
      puts "Genres:  #{movie.genres}"
      puts "Description: #{movie.longDescription}"
      puts "****************************************".colorize(:red)
      puts "Showtimes: "
      movie.showtimes.each do |s|
        puts "                      "
        puts s["theatre"]["name"].colorize(:yellow)
        puts "______________________"
        puts s["dateTime"].split("T")
        puts "                      "
        puts "Please click here to purchase your ticket."
        puts s["ticketURI"]
        puts "-------------------------------------------"
      end 
      #Start by writing out what you want it to look like in plain English
      # Movie: Movie titlev <--- attribute that you need to access
      # Genre: Romantic Comedy
      #Showing At:
      #Interpolate theaters and showtimes
    end
  end

  def self.destroy_all
    @@all.clear
  end
  
end
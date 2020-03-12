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
  
  # def self.display_theater_listing
  #       self.all.each do |movie|
  #       movie.showtimes.each do |s|
  #       puts "                      "
  #       puts s["theatre"]["name"].colorize(:yellow)
  #       puts "______________________"
  #       end 
  #     end
  # end 
  
  
  # def self.display_movie_listing
  #     self.all.each do |movie|
  #       movie.showtimes.each do |s|
  #     puts "                        "
  #     puts "Movie: #{movie.title}"
  #     puts "                        "
  #     puts "Genres:  #{movie.genres}"
  #     puts "Description: #{movie.longDescription}"
  #     puts "****************************************".colorize(:red)
  #     puts "Showtimes: "
  #     movie.showtimes.each do |s|  
  #       puts s["dateTime"].split("T")
  #       puts "                      "
  #       puts "Please click here to purchase your ticket."
  #       puts s["ticketURI"]
  #       puts "-------------------------------------------"
  #     end 
  #     #Start by writing out what you want it to look like in plain English
  #     # Movie: Movie titlev <--- attribute that you need to access
  #     # Genre: Romantic Comedy
  #     #Showing At:
  #     #Interpolate theaters and showtimes
  # end

  def self.destroy_all
    @@all.clear
  end
  
end
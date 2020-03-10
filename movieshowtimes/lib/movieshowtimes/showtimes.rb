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
      puts "Movie: #{movie["title"]}"
      puts "Genres:  #{movie["genres"]}"
      puts "Description: #{movie["longDescription"]}"
      puts "****************************************"
      puts "Showtimes: "
      puts "           Theater: #{movie["showtimes"][0]["theatre"]["name"]}"
      
      #Start by writing out what you want it to look like in plain English
      # Movie: Movie titlev <--- attribute that you need to access
      # Genre: Romantic Comedy
      #Showing At:
      #Interpolate theaters and showtimes
      # puts "Movie: #{movie.}"
      #puts interpolate movies showing
    end
  end

  def self.destroy_all
    @@all.clear
  end
  
end
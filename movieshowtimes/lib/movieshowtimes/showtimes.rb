class Movieshowtimes::Showtimes
  attr_accessor :tmsId, :rootId, :subType, :title, :releaseYear, :releaseDate, :titleLang, :descriptionLang, :entityType, :genres, :audience, :longDescription, :shortDescription, :topCast, :directors, :officialUrl, :qualityRating, :ratings, :advisories, :runTime, :animation, :preferredImage, :showtimes
  
  @@all = []
  
  def initialize(hash)
    hash.each {|k, v| self.send("#{k}=", v)}
    @@all << self
    binding.pry
  end
  
  def self.all
    @@all
  end

# def display_movie_listing
#   self.all.select {|theater| binding.pry}
  
# end  
  # def display_movie_listing
  #   # @@all.showtimes.each do |movie|
  #   #   # puts "Movie: #{movie.}"
  #   #   #puts interpolate movies showing
  #   # end
  #   binding.pry
  # end

  def self.destroy_all
    @@all.clear
  end
  
end
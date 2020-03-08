class Movieshowtimes::Showtimes
  attr_accessor :tmsId, :rootId, :subType, :title, :releaseYear, :releaseDate, :titleLang, :descriptionLang, :entityType, :genres, :audience, :longDescription, :shortDescription, :topCast, :directors, :officialUrl, :ratings, :advisories, :runTime, :animation, :preferredImage, :showtimes
  
  @@all = []
  
  def initialize(hash)
    hash.each {|k, v| self.send("#{k}=", v)}
    @@all << self
  end

  def display_movie_listing
    b = self.all[index]
binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
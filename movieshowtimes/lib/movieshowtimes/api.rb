class Movieshowtimes::API 
  
  attr_accessor :title, :genres, :description, :theatre, :datetime, :ticketuri 
  
  def initialize
    @title = title 
    @genres = genres
    @description = description
    @theatre = theatre
    @datetime = datetime 
    @ticketuri = ticketuri
  end 
  
  def fetch(zip, date)
    key = "tbvdtyjja5sq5ajccsbrek6a"
    url = "http://data.tmsapi.com/v1.1/movies/showings?startDate=#{date}&zip=#{zip}&api_key=#{key}"
    response = HTTParty.get(url)
    response.each do |h|
        @title = h["title"]
        @genres = h["genres"]
        @description = h["longDescription"]
        # I need to iterate through the outer hash and grab the following fields 
        # title (belongs to showtimes class)
        # genres (belongs to showtimes class)
        # longDescription (belongs to showtimes class)
      h["showtimes"].each do |s|
        @theatre = s["theatre"]["name"]
        @datetime = s["dateTime"]
        @ticketuri = s["ticketURI"]
        Movieshowtimes::Theatre.new(@theatre,zip)
        Movieshowtimes::Showtimes.new(@title,@description,@genres,@datetime,@ticketuri,@theatre)
        # I need to iterate through the inner hash and grab the following fields
        # Theatre => Name (belongs to theatre class)
        # dateTime  (belongs to showtimes class)
        # ticketURI (belongs to showtimes class)
      end   
    end 
  end
end
class Movieshowtimes::API 
  
  def fetch(zip, date)
    key = "tbvdtyjja5sq5ajccsbrek6a"
    url = "http://data.tmsapi.com/v1.1/movies/showings?startDate=#{date}&zip=#{zip}&api_key=#{key}"
    response = HTTParty.get(url)
    response.each do |h|
        title = h["title"]
        genres = h["genres"]
        description = h["longDescription"]
      h["showtimes"].each do |s|
        datetime = s["dateTime"]
        ticketuri = s["ticketURI"]
        theatre = s["theatre"]["name"]
        theatre_instance = Movieshowtimes::Theatre.find_or_create_by_name(theatre)
        Movieshowtimes::Showtimes.new(title,description,genres,datetime,ticketuri,theatre_instance)
      end   
    end 
  end

  
end
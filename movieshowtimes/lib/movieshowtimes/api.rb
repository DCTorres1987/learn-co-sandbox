class Movieshowtimes::API 
  def self.fetch(zip, date)
    key = "tbvdtyjja5sq5ajccsbrek6a"
    url = "http://data.tmsapi.com/v1.1/movies/showings?startDate=#{date}&zip=#{zip}&api_key=#{key}"
    response = HTTParty.get(url)
    response.each do |h|
        # I need to iterate through the outer hash and grab the following fields 
        # title (belongs to showtimes class)
        # genres (belongs to showtimes class)
        # longDescription (belongs to showtimes class)
      h.each do |theatre|
        # I need to iterate through the inner hash and grab the following fields
        # Theatre => Name (belongs to theatre class)
        # dateTime  (belongs to showtimes class)
        # ticketURI (belongs to showtimes class)
        binding.pry
      end   
    end  
  end
end
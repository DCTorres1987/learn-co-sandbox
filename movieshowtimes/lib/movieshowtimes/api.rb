class Movieshowtimes::API 
  def fetch(zip)
    key = "tbvdtyjja5sq5ajccsbrek6a"
    url = "http://data.tmsapi.com/v1.1/movies/showings?startDate=2020-03-06&zip=#{zip}&api_key=#{key}"
    response = HTTParty.get(url)
    binding.pry
  end 

end
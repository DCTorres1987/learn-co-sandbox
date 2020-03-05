class Movieshowtimes::API 
  def fetch(zip)
    key = "tbvdtyjja5sq5ajccsbrek6a"
    url = "http://data.tmsapi.com/v1.1/lineups?country=USA&postalCode=#{zip}&api_key=#{key}"
    response = HTTParty.get(url)
    binding.pry
  end 

end
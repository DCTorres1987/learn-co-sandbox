class Movieshowtimes::API 
  def fetch(zip, date)
    key = "tbvdtyjja5sq5ajccsbrek6a"
    url = "http://data.tmsapi.com/v1.1/movies/showings?startDate=#{date}&zip=#{zip}&api_key=#{key}"
    theater = HTTParty.get(url)
    @title = theater.map {|list_titles| puts "#{list_titles}" }
    binding.pry
    end
end
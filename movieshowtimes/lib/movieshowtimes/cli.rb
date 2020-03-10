class Movieshowtimes::CLI 
  def call 
    welcome
    showtimes_search
  end
  
  def welcome 
    puts "Welcome to Movie Show Times! Lets find a showtime in your area."
  end
  
  def showtimes_search
    puts "Please enter a 5-digit zipcode."
    zip = gets.chomp
    puts "Please enter showtime date (yyyy-mm-dd)"
    date = gets.chomp
    Movieshowtimes::API.new.fetch(zip, date)
    Movieshowtimes::Showtimes.display_movie_listing
  end
  
  
end
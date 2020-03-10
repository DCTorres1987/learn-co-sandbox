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
  
  def display_movie_showtimes
    
    puts  "   d8b"                                      
    puts  "   Y8P"                                      
    puts  "                                         "                                             
    puts  " .d8888b88888888b.  .d88b. 88888b.d88b.  8888b."
    puts  " d88P   888888 88bd8P  Y8b888 888  '88b     88b"
    puts  " 888    888888 88888888888888 888   888.d888888" 
    puts  "Y88b.   888888 888Y8b.    888 888   8888888 888" 
          "Y8888P888888  888 "Y8888  888 888  888"Y888888 
  
  
end
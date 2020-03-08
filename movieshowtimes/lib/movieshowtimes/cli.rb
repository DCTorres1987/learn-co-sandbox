class Movieshowtimes::CLI 
  def call 
    puts "Welcome to Movie Show Times! Please input a zipcode for showtimes in your area."
    zip = gets.chomp
    puts "Please enter showtime date (yyyy-mm-dd)"
    date = gets.chomp
    Movieshowtimes::API.new.fetch(zip, date)
  end
  
  
end
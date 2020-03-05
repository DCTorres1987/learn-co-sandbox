class Movieshowtimes::CLI 
  def call 
    puts "Welcome to Movie Show Times! What Movie would you like to see?"
    zip = gets.chomp
    # puts "What movie would you like to know about"
    # movie = gets.chomp
    MovieShowTimes::API.new.fetch(zip)
  end 
end
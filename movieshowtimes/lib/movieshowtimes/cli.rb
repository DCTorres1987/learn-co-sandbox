class Movieshowtimes::CLI 
  
  
  def call 
      welcome
      showtimes_search
      display_movie_showtimes
      display_theatre
      more_options
      # another_search
  end
  
  def welcome 
    puts "Welcome to Movie Show Times! Lets find a showtime in your area."
  end
  
  def showtimes_search
    puts "Please enter a 5-digit zipcode."
    zip = gets.chomp
    if zip.length == 5 
      puts "Please enter showtime date (yyyy-mm-dd)"
      date = gets.chomp
      Movieshowtimes::API.new.fetch(zip, date)
    else
      puts "Invalid Zip!  Please type again"
      showtimes_search
    end
  end
  
  def display_movie_showtimes
    puts "                                                               "
    puts  "        d8b".colorize(:red)                                   
    puts  "        Y8P".colorize(:red)                                 
    puts  "                                         "            
    puts  " .d8888b88888888b.  .d88b. 88888b.d88b.  8888b.".colorize(:red)
    puts  " d88P   888888 88bd8P   Y8b888 888  '88b     88b".colorize(:red)
    puts  " 888    888888 888888888888888 888  888.d888888".colorize(:red) 
    puts  " Y88b.  888888 888Y8b.     888 888  8888888 888".colorize(:red) 
    puts  "  Y8888P888888 888  'Y8888 888 888  888'Y888888".colorize(:red) 
    puts "*********************************************************"
    puts "********************************************"
    puts "*****************************"
    puts "***********"
   
  end
  
  def display_theatre
      puts "Here is a listing of your local theatre."
      Movieshowtimes::Theatre.all.each.with_index(1) do |name, index|
        puts "#{index}. " + name.theatre   
      end 
      puts "************************************"
  end
  
  def more_options
    puts "Please enter the number associated with theatre for movie listings."
    input = gets.chomp.to_i
    index = input - 1
    puts "Showtimes: "
    puts "***************************************************"
    user_choice = Movieshowtimes::Theatre.all[index]
    Movieshowtimes::Showtimes.find_by_name(user_choice)
  end  
  
  def another_search
    puts "Would you like to search another location for showtimes?"
    puts "Please input 'yes' or 'no'."
    choice = gets.chomp
    
      if choice == "yes"
        
        showtimes_search
        display_movie_showtimes
        another_search
      elsif choice == "no"
        goodbye
      else
        puts "I'm sorry, that is not a valid choice."
      end
  end
    
  def goodbye 
    Movieshowtimes::Showtimes.destroy_all
    Movieshowtimes::Theatre.destroy_all
    puts "Goodbye, and thanks for using our service!"
  end
end
class Movieshowtimes::CLI 
  
  def call 
      welcome
      showtimes_search
      display_movie_showtimes
      display_theatre
      movie_options
      movie_search
  end
  
  #1
  def welcome 
    puts "Welcome to Movie Show Times! Lets find a showtime in your area."
  end
  
  #2
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
  
  #3
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
  
  #4
  def display_theatre
      puts "Here is a listing of your local theatre."
      Movieshowtimes::Theatre.all.each.with_index(1) do |name, index|
        puts "#{index}. " + name.theatre   
      end 
      puts "************************************"
  end
  
  #5
  def movie_options
    puts "Please enter the number associated with theatre for movie listings."
    input_1 = gets.chomp.to_i
    index_1 = input_1 - 1
    puts "Movie Listing: "
    puts "***************************************************"
    user_choice_1 = Movieshowtimes::Theatre.all[index_1]
    Movieshowtimes::Showtimes.movie_listings(user_choice_1)
    
    Movieshowtimes::Showtimes.all_movies.each.with_index(1) do |name, index|
     puts "#{index}. " + name
    end
    
    puts "                                                                                       "
    puts "If you would like to see showtimes, please enter the number associated with that movie."
    
    input_2 = gets.chomp.to_i
    index_2 = input_2 - 1
    user_choice_2 = Movieshowtimes::Showtimes.all_movies[index_2]
    showtimes = Movieshowtimes::Showtimes.showtime_listings(user_choice_1,user_choice_2)
    showtimes.each do |s|
    puts "Date/Time: #{s.datetime.split("T")}"
    puts "TicketURI: #{s.ticketuri}"
    end
  end
  
  #6
  def movie_search
    puts "                                                  "
    puts "                                                  "
    puts "Would you like to see showtimes for another movie?. Please type 'yes' or 'no'."
    
    input = gets.chomp 
    
    if input == "yes"
      additional_movie_search
      
    else input == "no"
      puts "Would you like to choose a different theater? Please type 'yes' or 'no'."
      another_search

    end 
  end
  
  #7
  def additional_movie_search
    puts "Movie Listing: "
    puts "***************************************************"
    Movieshowtimes::Showtimes.movie_listings(user_choice_1)
    
    Movieshowtimes::Showtimes.all_movies.each.with_index(1) do |name, index|
     puts "#{index}. " + name
    end
    
    puts "                                                                                       "
    puts "If you would like to see showtimes, please enter the number associated with that movie."
    
    input_2 = gets.chomp.to_i
    index_2 = input_2 - 1
    user_choice_2 = Movieshowtimes::Showtimes.all_movies[index_2]
    Movieshowtimes::Showtimes.showtime_listings(user_choice_1,user_choice_2)
    movie_search
  end
  
  def another_search
    choice = gets.chomp
    
      if choice == "yes"
        showtimes_search
        display_movie_showtimes
        display_theatre
        movie_options
        movie_search
        
      else choice == "no"
        goodbye
      end
  end
    
  def goodbye 
    Movieshowtimes::Showtimes.destroy_all
    Movieshowtimes::Theatre.destroy_all
    puts "Goodbye, and thanks for using our service!"
  end
end
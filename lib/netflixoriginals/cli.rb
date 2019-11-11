class Netflixoriginals::CLI
  def call
    list_series
    reviews
    goodbye
  end

  def list_series
    puts "The Best Netflix Original Series Right Now, Ranked"
    puts <<-DOC
    1. BoJack Horseman
      6 seasons, 68 episodes | IMDb: 8.6/10
    2. Stranger Things
      3 seasons, 25 episodes | IMDb: 8.8/10
    DOC
  end

  def reviews
    input = nil
    while input != "exit"
      puts "Please enter the number of the Netflix Original Series for a quick review of the show or type exit to exit or type list to see the shows again:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on number 1"
      when "2"
        puts "More info on number 2"
      when "list"
        list_series
      else
        puts "Please try again. Incorrect entry."
      end
    end
  end

  def goodbye
    puts "Thank you for visiting. Goodbye."
  end
end

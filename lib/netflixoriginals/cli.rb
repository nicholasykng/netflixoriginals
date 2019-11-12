class Netflixoriginals::CLI
  def call
    puts "Welcome to the Best Netflix Series According to Rotten Tomatoes."
    Netflixoriginals::Scraper.scrape_index_page("http://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/6/")
    reviews
    goodbye
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

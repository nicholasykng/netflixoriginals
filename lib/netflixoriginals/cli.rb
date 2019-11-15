class Netflixoriginals::CLI

  def call
    make_series
    puts "Welcome to the List of Top Netflix Original Movies According to Rotten Tomatoes."
    puts ""
    puts ""
    puts "It is listed by Rank and Netflix Original Movie Title."
    puts ""
    puts ""
    start
  end

  def make_series
    series_array = Netflixoriginals::Scraper.scrape_index_page("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/")
    Netflixoriginals::Series.create_from_collection(series_array)
  end

  def start
    Netflixoriginals::Series.all.each do |series|
      puts "#{series.rank}. #{series.title}"
    end
    puts ""
    puts ""
    puts "To find out more information about a series please enter the corresponding rank number:"
    puts ""
    puts ""
    input = gets.strip.to_i
      if input.between?(1, Netflixoriginals::Series.all.size) == true
        movie = Netflixoriginals::Series.find(input)
        add_information = Netflixoriginals::Scraper.scrape_main_page(movie.url)
        movie.add_information(add_information)
        puts "========================================================================================================================================="
        puts "Rank: #{movie.rank}"
        puts ""
        puts ""
        puts "Title: #{movie.title}"
        puts ""
        puts ""
        puts "Year Released: #{movie.year}"
        puts ""
        puts ""
        puts "#{movie.starring}"
        puts ""
        puts ""
        puts "Synopsis: #{movie.synopsis}"
        puts ""
        puts ""
        puts "Critic Consensus: #{movie.critic_consensus}"
        puts ""
        puts ""
        puts "Tomatometer Score: #{movie.tomatometer}"
        puts ""
        puts ""
      else
        start
    end
  puts "Would you like to view the list again? (Y/N)"
  input_1 = gets.strip
  if input_1 == "Y" || input_1 == "y"
    start
  elsif input_1 == "N" || input_1 == "n"
    goodbye
  else
    puts "Incorrect entry. Please try again. Restarting program. "
    start
  end
end

  def goodbye
    puts ""
    puts ""
    puts "Please remember to check back for updates to the Rank of Netflix Original Movies. Goodbye!"
    puts ""
    puts ""
  end

end

class Netflixoriginals::CLI

  def call
    make_series
    puts "Welcome to the List of Top Netflix Original Movies According to Rotten Tomatoes."
    puts "The list is sorted from the left to right: Movie Rank, Movie Title, Year Movie was Released, and Tomatometer Score"
    start
  end

  def make_series
    series_array = Netflixoriginals::Scraper.scrape_index_page("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/")
    Netflixoriginals::Series.create_from_collection(series_array)
  end

  def start
    Netflixoriginals::Series.all.each do |series|
      puts "#{series.rank}. #{series.title} #{series.year} #{series.tomatometer}"
    end
    puts "To find out more information about a series please enter the corresponding rank number:"
    input = gets.strip.to_i
      if input.between?(1,98) == true
      movie = Netflixoriginals::Series.find(input)
      puts "Title: #{movie.title}"
      puts "#{movie.synopsis}"
      puts "#{movie.starring}"
      puts "Rotten Tomatoes URL for this movie: #{movie.url}"
    else
      start
    end
  puts "Would you like to view the list again? (Y/N)"
  input_1 = gets.strip
  if input_1 == "Y" || input_1 == 'y'
    start
  elsif input_1 == "N" || input_1 == 'n'
    puts "Please remember to check back in for updates to the Rank of Netflix Original Movies. Goodbye!"
  else
    puts "Incorrect entry. Restarting program."
    start
  end
end
end

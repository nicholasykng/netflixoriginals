class Netflixoriginals::CLI

  def call
    make_series
    puts "Welcome to the List of Top Netflix Original Movies According to Rotten Tomatoes."
    puts "The list is sorted from the left to right: Movie Rank, Movie Title, Year Movie was Released, and Tomatometer Score"
    start
    goodbye
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
  end


  def goodbye
    puts "Thank you for visiting. Goodbye."
  end
end

class Netflixoriginals::CLI

  def call
    make_series
    puts "Welcome to the List of Top Netflix Original Series According to Rotten Tomatoes."
    start
    goodbye
  end

  def make_series
    series_array = Netflixoriginals::Scraper.scrape_index_page("http://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/6/")
    Netflixoriginals::Series.create_from_collection(series_array)
  end

  def start
    Netflixoriginals::Series.all.each do |series|
      puts "#{series.rank}. #{series.url}"
    end
  end


  def goodbye
    puts "Thank you for visiting. Goodbye."
  end
end

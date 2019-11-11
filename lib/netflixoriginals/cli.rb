class Netflixoriginals::CLI
  def call
    list_series
    reviews
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
    puts "Please enter the number of the Netflix Original Series for a quick review of the show:"
    input = gets.strip
    case input
    when "1"
      puts "More info on number 1"
    when "2"
      puts "More info on number 2"
  end
end
end

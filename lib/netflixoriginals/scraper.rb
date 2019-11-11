class Netflixoriginals::Scraper

  def get_page
    Nokogiri::HTML(open("https://uproxx.com/tv/best-netflix-original-series-to-watch-right-now-ranked/"))
  end

  def scrape_series_index
    self.get_page.css("div.post-page")
    binding.pry
  end
end

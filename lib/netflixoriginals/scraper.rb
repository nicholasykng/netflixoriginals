class Netflixoriginals::Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    index_page.css("div.articleContentBody").each do |series|
      series_hash = {
        title: series.css("div.article_movie_title h2 a").text,
        year: series.css("span.subtle.start-year").text,
        tomatometer: series.css("span.tMeterScore").text,
        rank: series.css("div.countdown-index").text,
        synopsis: series.css("div.info.synopsis").text,
        starring: series.css("div.info.cast").text
      }
      binding.pry
      Netflixoriginals::Series.new(series_hash)
    end
  end
end

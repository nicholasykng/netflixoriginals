class Netflixoriginals::Scraper

  def self.scrape_index_page(index_url)
    shows = []
    index_page = Nokogiri::HTML(open(index_url))
    index_page.css("div.articleContentBody").each do |card|
      card.css("div.row.countdown-item").each do |series|
        series_title = series.css("div.article_movie_title h2 a").text,
        series_year = series.css("span.subtle.start-year").text,
        series_tomatometer = series.css("span.tMeterScore").text,
        series_rank = series.css("div.countdown-index").text,
        series_synopsis = series.css("div.info.synopsis").text,
        series_starring = series.css("div.info.cast").text
        shows << {title: series_title, year: series_year, tomatometer: series_tomatometer, rank: series_rank, synopsis: series_synopsis, starring: series_starring}
        end
      end
        shows
      end
    end

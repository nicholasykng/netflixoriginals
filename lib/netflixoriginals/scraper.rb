class Netflixoriginals::Scraper

  def self.scrape_index_page(index_url)
    shows = []
    index_page = Nokogiri::HTML(open(index_url))
    index_page.css("div.articleContentBody").each do |card|
      card.css("div.row.countdown-item").each do |series|
        series_title = series.css("div.article_movie_title a[href]").text.strip
        series_year = series.css("span.subtle.start-year").text.strip
        series_tomatometer = series.css("span.tMeterScore").text.strip
        series_rank = series.css("div.countdown-index").text.strip
        series_synopsis = series.css("div.info.synopsis").text.strip.gsub("[More]", "")
        series_starring = series.css("div.info.cast").text.strip
        series_url = series.css("h2 a").attribute("href").value.gsub("//", "")
        shows << {title: series_title, year: series_year, tomatometer: series_tomatometer, rank: series_rank, synopsis: series_synopsis, starring: series_starring, url: series_url}
        end
      end
        shows
      end
    end

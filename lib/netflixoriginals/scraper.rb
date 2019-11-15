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
        series_starring = series.css("div.info.cast").text.strip
        series_url = series.css("h2 a").attribute("href").value
        shows << {title: series_title, year: series_year, tomatometer: series_tomatometer, rank: series_rank, starring: series_starring, url: series_url}
        end
      end
        shows
      end

      def self.scrape_main_page(main_url)
        extra_info = []
        main_page = Nokogiri::HTML(open(main_url))
        full_synopsis = main_page.css("div.movie_synopsis.clamp.clamp-6.js-clamp").text.strip
        critic_consensus_description = main_page.css("p.mop-ratings-wrap__text.mop-ratings-wrap__text--concensus").text.strip
        extra_info = {synopsis: full_synopsis, critic_consensus: critic_consensus_description}
        extra_info
      end
      
    end

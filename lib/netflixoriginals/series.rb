class Netflixoriginals::Series

  attr_accessor :title, :year, :tomatometer, :rank, :starring, :url, :synopsis, :critic_consensus

  @@all = []

  def initialize(series_hash)
    series_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self

  end

  def self.create_from_collection(series_array)
    series_array.each do |series_hash|
      Netflixoriginals::Series.new(series_hash)
    end
  end

  def self.all
    @@all
  end

  def self.find(rank)
    @@all[self.all.size - rank]
  end

  def add_information(extra_info_hash)
    extra_info_hash.each {|attribute, value| self.send("#{attribute}=", value)}
    self
  end

  def self.find_by_title(title)
    self.all.select {|movie| movie.title.downcase == title.downcase}
  end

end

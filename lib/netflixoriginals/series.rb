class Netflixoriginals::Series

  attr_accessor :title, :year, :tomatometer, :rank, :synopsis, :starring, :url

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
    @@all[98-rank]
  end
end

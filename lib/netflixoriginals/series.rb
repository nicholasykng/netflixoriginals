class Netflixoriginals::Series

  attr_accessor :title, :year, :tomatometer, :rank, :synopsis, :starring

  @@all = []

  def initialize(movie_hash)
    movie_hash.each {|attribute, value| self.send("#{attribute}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end
end

require "pry"

class Artist

    attr_accessor :name
    @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def songs
      Song.all.select { |i| i if i.artist == self }
  end

  def new_song(name,genre)
    Song.new(name, self, genre)
  end

  def genres
    songs.map {|i| i.genre}
  end

end

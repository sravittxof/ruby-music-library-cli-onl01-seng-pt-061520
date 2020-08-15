require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    
    if genre != nil
      self.genre = genre
    end
  end
  
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    @name = name
    Song.new(@name).save
    self
  end
  
  def self.find_by_name(name)
    Song.all.find { |song| song.name = name }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
  end
  
  def artist=(artist)
    #if @artist == nil
      @artist = artist
      artist.add_song(self)
    #end
  end
  
  def genre=(genre)
    if @genre == nil
      @genre = genre
      genre.add_song(self)
    end
  end
  
  
end
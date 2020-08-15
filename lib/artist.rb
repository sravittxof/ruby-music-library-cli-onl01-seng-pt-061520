class Artist

extend Concerns::Findable

  attr_accessor :name, :songs
  #attr_reader :genre
  @@all = []


  def initialize(name)
    @name = name
    @songs = []
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
    Artist.new(@name).save
    self
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
      @songs << song
    end
  end
  
  def genres
    songs.collect { |song| song.genre }.uniq
  end
  
end
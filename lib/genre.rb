class Genre

extend Concerns::Findable

  attr_accessor :name, :songs
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
    Genre.new(@name).save
    self
  end
  
  def artists
    self.songs.each.artist
  end
  
  def add_song(song)
   # if songs.include?(song) == false
   #   song.genre = self
    #  @songs << song
    #end
  #end  
  
  
end
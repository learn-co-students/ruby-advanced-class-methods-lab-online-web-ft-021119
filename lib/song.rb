class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    mySong = Song.new
    mySong.save
    mySong
  end

  def self.new_by_name(songName)
    songone = self.new
    songone.name = songName
    songone
  end

  def self.create_by_name(songNameTwo)
    songtwo = self.new
    songtwo.name = songNameTwo
    songtwo.save
    songtwo
  end

  def self.find_by_name(findSong)
    @@all.find{|song| song.name == findSong}
  end

  def self.find_or_create_by_name(findSongTwo)

  end

end

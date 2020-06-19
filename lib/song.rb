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

  def self.find_or_create_by_name(song)

      find_by_name(song) || create_by_name(song)

=begin
    findit = findSongTwo
    if findit == find_by_name(findSongTwo)
      find_by_name(findSongTwo)
    else  findit != findSongTwo
      create_by_name(findSongTwo)
    end
=end
  end

  def self.alphabetical
    self.all.sort_by{|songs| songs.name}

  end

  def self.new_from_filename(file)
    filenames = self.new
    filenames.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    filenames.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    filenames
  end

  def self.create_from_filename(file)
    filenametwo = self.new
    filenametwo.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    filenametwo.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    filenametwo.save
    filenametwo
  end

  def self.destroy_all
    self.all.clear
  end

end

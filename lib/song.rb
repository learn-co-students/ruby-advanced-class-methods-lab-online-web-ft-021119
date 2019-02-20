class Song
  attr_accessor :name, :artist_name
  @@all = []

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    @@all<< song
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    @@all<< song
    song
  end

  def Song.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def Song.alphabetical()
    @@all.sort_by{ |song| song.name }
    #binding.pry
  end

  def Song.new_from_filename(file_name)
    song = self.new
    formatted_name = (file_name.split(" - ")[1]).chomp('.mp3')
    song.artist = file_name.split(" - ")
    binding.pry
  end





end

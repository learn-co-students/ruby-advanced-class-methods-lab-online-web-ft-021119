class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@create =

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
  song.name = title
  song
  end

  def self.create_by_name(title)
     song = self.create
     song.name = title
     #@@all << song.name
    song
  #song
  #binding.pry
  end

  def self.find_by_name(title)
  #  @@all.include?(song.name)
     self.all.detect {|e| e.name == title}
      #return song.name
      #binding.pry
    #end
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
  self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(file_name)
    new = file_name.split(" - ") 
    song = self.new
    self.name = title
    self.artist_name = artist_name
    #title_mp3 =
  #binding.pry
  end


end

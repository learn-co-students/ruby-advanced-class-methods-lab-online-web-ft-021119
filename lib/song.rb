require 'pry'

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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
  #  binding.pry
  match = false
    self.all.each do |songs|
      songs.name == song_name ? match = songs : nil
    end
    match
  end

  def self.find_or_create_by_name(this_song)
    binding.pry
    existing_or_not = nil
    self.find_by_name(this_song).name == this_song ? :

  #self.all.collect {|song| song == self.find_by_name(this_song) ? song : self.create_by_name(this_song)}
end
end

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new()
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end 
  
  def self.find_by_name(name)
    @@all.find do |song|
      if song.name == name
        return song
      end
    end
  end
  
  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name) 
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = Song.new
    song.name = filename.split("-")[1].strip.chomp(".mp3")
    song.artist_name = filename.split("-")[0].strip
    song
  end  
  
   def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
   end  
  
    def self.destroy_all
      @@all.clear
    end
end
 
 
 
 
  # def initialize (name, artist_name)
   #  @name = name
   # @artist_name = artist_name
   # @@count +=1
   # @@genres << genre
    # @@artists << artist
#  end
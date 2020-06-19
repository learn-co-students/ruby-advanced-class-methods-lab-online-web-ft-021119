require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    new = Song.new
    new.save
    new
  end 
  
  def self.new_by_name(string)
    new = Song.new
    new.name = string 
    new 
  end 
  
  def self.create_by_name(string)
    new = Song.new 
    new.name = string 
    @@all << new 
    new 
  end 
  
  def self.find_by_name(string)
    @@all.find {|name| name.name == string}
  end 
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by {|x| x.name }
  end 
  
  def self.new_from_filename(file)
    remove_end = file.chomp(".mp3")
    final = remove_end.split(" - ")
   
    song = self.new
    song.name = final [1]
    song.artist_name = final[0]
    song
  end
  def self.create_from_filename(file)
    new_from_filename(file).save
  end 
  
  def self.destroy_all
    @@all.clear 
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

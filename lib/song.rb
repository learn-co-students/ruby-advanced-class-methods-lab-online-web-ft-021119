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
    song = Song.new
    self.all << song 
    song 
  end 
  
  def self.new_by_name(song_name)
    song = Song.new 
    song.name = song_name
    song 
  end 
  
  def self.create_by_name(song_name)
    song = Song.new 
    song.name = song_name 
    self.all << song 
    song 
  end 
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil 
      self.create_by_name(song_name)
    else 
      self.find_by_name(song_name)
    end
  end 
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(file_name)
    file_name_array = file_name.split(/[-.]/)
    artist_name = file_name_array[0].to_s.strip
    song_name = file_name_array[1].to_s.strip
    
    song = Song.new 
    song.name = song_name
    song.artist_name = artist_name
    
    song
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
  def self.destroy_all
    self.all.clear
  end 
 
end

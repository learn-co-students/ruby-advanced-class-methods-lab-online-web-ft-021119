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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.each do |index|
      return index if index.name == name
    end
    nil
  end #end of .find_by_name Class Method

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil || song == false
      song = self.create_by_name(name)
    else
      song
    end
  end #end of find_or_create

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(filename)
    file_ary = filename.split(/[-.]/)
    # binding.pry
    song = self.create_by_name(file_ary[1].strip!)
    song.artist_name = file_ary[0].strip!
    song
  end #end of .new_from file

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end #end of .create_from_filename

  def self.destroy_all
    @@all.clear
  end
end #end of Class

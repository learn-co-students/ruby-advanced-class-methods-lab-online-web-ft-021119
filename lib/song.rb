require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song

  end

#How do I expose the passed-in argument, name, as the newly-instantiated song's title?
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    song = @@all.find {|song| song.name == name}
      # if true
      #   return song
      # else
      #   return "falsey"
      # end
    song
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil

    else self.create_by_name(name)
    end
  end





  def save
    self.class.all << self
  end
# binding.pry
end

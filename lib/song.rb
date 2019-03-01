require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def name=(name)
  #   @name = name
  # end

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
    Song.find_by_name(name) || Song.create_by_name(name)

    # # this makes sense, but does not work:
    # if Song.find_by_name(name) == nil
    #   Song.create_by_name(name)
    # else
    #   Song.find_by_name(name)
    # end
  end

  def Song.alphabetical()
    @@all.sort_by{ |song| song.name }
  end

  def Song.new_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1]).chomp(".mp3")
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def Song.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1]).chomp(".mp3")
    song.artist_name = filename.split(" - ")[0]
    @@all<< song
    song
  end

  def Song.destroy_all
    @@all = []
  end
end

# def pattern(n)
#
#   if n <= 0
#     return ""
#   else
#     nums = *(1..n)
#     nums.each do |num|
#       if num.even?
#         nums.delete(num)
#       end
#       nums
#     end
#
#     results = []
#     nums.each do |n|
#       n.times do results<< n
#         results<< "\n"
#       end
#     end
#     results
#     binding.pry
#   end
# end
#
# pattern(6)

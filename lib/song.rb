require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  	#binding.pry	
  	
  			


  				def self.create
  				song = self.new
  				#binding.pry
             	@@all << song
             	song
				end

					def self.new_by_name(name)
					song = self.new
					song.name = name
					return song
					#binding.pry
					end

						def self.create_by_name(name)
						song = self.new
						song.name = name
						@@all << song
				#binding.pry
						return song
						#binding.pry
						end

							def self.find_by_name(name)
							@@all.find do |songs|
							#binding.pry
							if songs.name == name
							return songs
						else 
							false
								#binding.pry					
							end
							end

							end

				

								def self.find_or_create_by_name(name)
							    #binding.pry
								 

								 if self.find_by_name(name) 
											
								return self.find_by_name(name)
								#binding.pry
								elsif self.find_by_name(name) != name
								 	return self.create_by_name(name)
								 else return name
								#return# name
								end
								end
					

										

									def self.alphabetical
									@@all.sort_by{ |song| song.name }
									end



										def self.destroy_all
										@@all = []
										end

								def self.new_from_filename(file_name)
								

								a_name = file_name.split(" - ").first  #artist_name
								song_name = ((file_name.split(" - ").last).split(".").first) # song name
							
								new_song = self.new
								new_song.artist_name = a_name
								new_song.name = song_name
								new_song.save
								return new_song
								end

						def self.create_from_filename(file_name)
								artist_name = file_name.split(" - ").first  #artist_name
								song_name = ((file_name.split(" - ").last).split(".").first) # song name
							
								new_song = self.new
								new_song.artist_name = artist_name
								new_song.name = song_name
								new_song.save
								
					#binding.pry
						end


							


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
#song = Song.new("Blank Space")
end

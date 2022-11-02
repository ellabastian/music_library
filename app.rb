require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

class Application

    def initialize(database_name, io, album_repository, artist_repository)
        DatabaseConnection.connect(database_name)
        @io = io
        @album_repository = album_repository
        @artist_repository = artist_repository
    end

    # def run
    #     @io.puts "Welcome to the music library manager!
    #         What would you like to do?
    #         1 - List all albums 
    #         2- List all artists
    #         Enter your choice:"
    #     choice = @io.gets.chomp    
    #     @io.puts "You have chosen #{choice}"
        
    #     if choice == 1
    #         @album_repository = AlbumRepository.new
            
    #         @album_repository.all.each do |album|
    #             @io.puts "#{album}"
    #         end
    #     end
    # end
end

if __FILE__ == $0
    app = Application.new(
      'music_library',
      Kernel,
      AlbumRepository.new,
      ArtistRepository.new
    )
    app.run
end

    # album_repository = AlbumRepository.new

    # sql = 'Select id, title FROM albums;'
    # result = DatabaseConnection.exec_params(sql, [])

    # album_repository.all.each do |album|
    #     p album
    # end

    # album = album_repository.find(6)

    # puts album.id
    # puts album.title
    # puts album.release_year


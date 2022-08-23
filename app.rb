require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

album_repository = AlbumRepository.new

sql = 'Select id, title FROM albums;'
result = DatabaseConnection.exec_params(sql, [])

album_repository.all.each do |album|
    p album
end